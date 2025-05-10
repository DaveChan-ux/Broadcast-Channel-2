import SwiftUI

extension Color {
    static let customLightGray = Color(red: 230/255, green: 230/255, blue: 230/255)
}

struct ContentView: View {
    @State private var showScrollUpHint: Bool = false
    @State private var isLoadingOlderMessages: Bool = false
    @State private var didInitialScrollSequence: Bool = false
    // Controls how far up the content moves - this is a value between 0 and 1
    // Lower values position content higher up (more scrolled)
    @State private var scrollPositionY: CGFloat = 0.9

    @State private var scrollViewProxy: ScrollViewProxy? = nil
    let topItemID = "topMessage"
    let lastMessageID = "last-message-id"
    let seventhMessageActualID = "seventh-message-actual-id"
    let animatedMessageID = "animatedMessage"
    let coordinateSpaceName = "scrollViewCoordinateSpace"

    var body: some View {
        NavigationStack {
            ZStack {
                backgroundView

                VStack(spacing: 0) {
                    loadingIndicator

                    messageListView
                        .navigationTitle("Chat with Amber")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbarBackground(.visible, for: .navigationBar)
                        .toolbarBackground(.regularMaterial, for: .navigationBar)
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button(action: {}) {
                                    Image(systemName: "chart.bar.fill").foregroundColor(Color.gray)
                                }
                            }
                            ToolbarItem(placement: .topBarTrailing) {
                                Button(action: {}) {
                                    Image(systemName: "ellipsis").foregroundColor(Color.gray)
                                }
                            }
                            ToolbarItem(placement: .topBarLeading) {
                                Button(action: {}) {
                                    Image(systemName: "arrow.left").foregroundColor(Color.gray)
                                }
                            }
                        }
                }

                pullUpHintView
            }
        }
    }

    // MARK: - Component Views

    var backgroundView: some View {
        Image("applebg1")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .opacity(0.5)
    }

    var loadingIndicator: some View {
        Group {
            if isLoadingOlderMessages {
                ProgressView()
                    .padding(.vertical, 10)
                    .transition(.opacity)
            }
        }
    }

    var messageListView: some View {
        ScrollView {
            ScrollViewReader { proxy in
                messagesContent(proxy: proxy)
                    .onAppear {
                        handleInitialSetup(proxy: proxy)
                    }
            }
        }
        .coordinateSpace(name: coordinateSpaceName)
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            if value > -5 && value < 100 && !isLoadingOlderMessages && showScrollUpHint && didInitialScrollSequence {
                handleRefreshLogic()
            }
        }
    }

    func messagesContent(proxy: ScrollViewProxy) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            // Scroll position detector
            GeometryReader { geometry in
                Color.clear
                    .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named(coordinateSpaceName)).minY)
            }
            .frame(height: 0)

            // Top anchor for scrolling
            Color.clear.frame(height: 1)
                .id(topItemID)

            // All message views
            MessageView(text: "Hey happy Monday", imageName: "dctc", isUser: true)
            MessageView(text: "Hey happy Monday", imageName: "dctc", isUser: true)
            MessageView(text: "Hey happy Monday", imageName: "dctc", isUser: true)

            // Fourth message with ID
            VStack(alignment: .trailing) {
                HStack {
                    Text("Man what a crazy weekend.")
                        .foregroundColor(.gray)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                        .cornerRadius(8)
                        .id(animatedMessageID)
                    Image("dctc").resizable().scaledToFill().frame(width: 40, height: 40).clipShape(.circle)
                }
                .padding(.leading, 40)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)

            MessageView(text: "really.", imageName: "avb", isUser: false)
            MessageView(text: "tell me all about it.", imageName: "avb", isUser: false)
            MessageView(text: "I had a pretty good weekend too.", imageName: "avb", isUser: false)

            MessageView(text: "Man seattle gets so nice around this time of year.", imageName: "dctc", isUser: true)
                .id(seventhMessageActualID)

            MessageView(text: "This year it got warm quickly. Last year was pretty depressing.", imageName: "avb", isUser: false)
            MessageView(text: "WhatI like about this year is that I have a lot of free time.", imageName: "avb", isUser: false)
            MessageView(text: "Sometime I wonder if I should be interested in something else", imageName: "dctc", isUser: true)
            MessageView(text: "But I'll keep trying", imageName: "dctc", isUser: true)
            MessageView(text: "This message is just to let you know that I am still working on this project.", imageName: "dctc", isUser: true)
            MessageView(text: "And now, I am ready to launch!", imageName: "dctc", isUser: true)
            MessageView(text: "blah blah blah", imageName: "dctc", isUser: true)
            MessageView(text: "oh look I forgot a message", imageName: "dctc", isUser: true)
            MessageView(text: "oh look I forgot a message", imageName: "dctc", isUser: true)

            // Last message with ID
            MessageView(text: "oh look I forgot a message", imageName: "dctc", isUser: true)
                .id(lastMessageID)

            // Space for hint - make sure there's room for it
            Color.clear.frame(height: 40)
        }
        .padding(10)
    }

    var pullUpHintView: some View {
        Group {
            if showScrollUpHint && !isLoadingOlderMessages {
                VStack {
                    Spacer()
                    Text("pull up to refresh")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(6)
                        .background(Material.thin)
                        .clipShape(Capsule())
                        .padding(.bottom, 15)
                        .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
            }
        }
    }

    // MARK: - Helper Methods

    func handleInitialSetup(proxy: ScrollViewProxy) {
        self.scrollViewProxy = proxy

        if !didInitialScrollSequence {
            // Initially scroll to position the LAST MESSAGE at the bottom
            proxy.scrollTo(lastMessageID, anchor: .bottom)

            // After a delay, show hint and explicitly scroll up
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                // First scroll up
                withAnimation(.easeInOut(duration: 0.5)) {
                    proxy.scrollTo(lastMessageID, anchor: UnitPoint(x: 0.5, y: scrollPositionY))
                }

                // Then show the hint after the scroll completes
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    withAnimation {
                        self.showScrollUpHint = true
                    }
                    self.didInitialScrollSequence = true
                }
            }
        }
    }

    func handleRefreshLogic() {
        guard !isLoadingOlderMessages else { return }

        withAnimation {
            showScrollUpHint = false // Disappears
            isLoadingOlderMessages = true // Loading indicator appears
        }

        // 3. Simulate loading data
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // In a real app, you'd add new messages to the top of your data source here.
            // For this demo, we just simulate the end of loading.

            withAnimation {
                isLoadingOlderMessages = false // Loading indicator disappears
            }

            // 4. Page goes back to its normal state
            // Scroll to the top to show the "newly loaded" (simulated) content
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Slight delay for UI to update
                 withAnimation(.easeInOut) {
                    scrollViewProxy?.scrollTo(topItemID, anchor: .top)
                }
            }
        }
    }
}

// Helper Struct for a reusable Message View (recommended)
struct MessageView: View {
    let text: String
    let imageName: String
    let isUser: Bool // true if user's message (trailing), false if other (leading)

    var body: some View {
        VStack(alignment: isUser ? .trailing : .leading) {
            HStack {
                if !isUser {
                    Image(imageName)
                        .resizable().scaledToFill().frame(width: 40, height: 40).clipShape(.circle)
                }
                Text(text)
                    .foregroundColor(.gray)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(8)
                if isUser {
                    Image(imageName)
                        .resizable().scaledToFill().frame(width: 40, height: 40).clipShape(.circle)
                }
            }
            .padding(isUser ? .leading : .trailing, 40) // Ensure message bubble doesn't take full width
        }
        .frame(maxWidth: .infinity, alignment: isUser ? .trailing : .leading)
    }
}

// PreferenceKey to track scroll offset
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
