import SwiftUI

extension Color {
    static let customLightGray = Color(red: 230/255, green: 230/255, blue: 230/255)
}

struct ContentView: View {
    @State private var showScrollUpHint: Bool = false
    @State private var isLoadingOlderMessages: Bool = false
    @State private var didInitialScrollSequence: Bool = false
    @State private var scrollPositionY: CGFloat = 0.9

    // Add states to track scroll position and direction
    @State private var previousScrollOffset: CGFloat = 0
    @State private var isScrollingUp: Bool = false
    @State private var dragInProgress: Bool = false
    @State private var pullDistance: CGFloat = 0

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
                    messageListView
                        .navigationTitle("AmberVenzBox")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbarBackground(.visible, for: .navigationBar)
                        .toolbarBackground(.regularMaterial, for: .navigationBar)
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button(action: {}) {
                                    Image(systemName: "square.and.arrow.up").foregroundColor(Color.gray)
                                }
                            }
                            ToolbarItem(placement: .topBarTrailing) {
                                Button(action: {}) {
                                    Image(systemName: "bell.slash").foregroundColor(Color.gray)
                                }
                            }
                            ToolbarItem(placement: .topBarLeading) {
                                Button(action: {}) {
                                    Image(systemName: "arrow.left").foregroundColor(Color.gray)
                                }
                            }
                        }
                }

                // Bottom status elements - either hint or loading indicator
                VStack {
                    Spacer()

                    if isLoadingOlderMessages {
                        // Loading indicator
                        ProgressView()
                            .padding(6)
//                            .background(Material.thin)
                            .clipShape(Capsule())
                            .padding(.bottom, 15)
                            .transition(.opacity)
                    } else if showScrollUpHint && (isScrollingUp || dragInProgress) {
                        // Pull up to refresh hint
                        Text("pull up to refresh")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(12)
//                            .background(Material.thin)
                            .clipShape(Capsule())
                            .padding(.bottom, 8)
                            .transition(.opacity)
                    }
                }
            }
        }
    }

    // MARK: - Component Views

    var backgroundView: some View {
        Color.white
            .edgesIgnoringSafeArea(.all)
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
        .simultaneousGesture(
            DragGesture(minimumDistance: 5, coordinateSpace: .named(coordinateSpaceName))
                .onChanged { gesture in
                    dragInProgress = true

                    // Update scrolling direction
                    let currentPosition = gesture.translation.height
                    isScrollingUp = currentPosition < 0 // In SwiftUI, scrolling up (to see more at bottom) has negative translation

                    // Update pull distance for threshold detection
                    if isScrollingUp && didInitialScrollSequence && showScrollUpHint {
                        pullDistance = currentPosition

                        // Check if we've pulled enough to trigger loading
                        if pullDistance < -50 && !isLoadingOlderMessages {
                            withAnimation {
                                isLoadingOlderMessages = true
                                showScrollUpHint = false
                            }

                            // Handle the refresh logic
                            handleRefreshLogic()
                        }
                    }
                }
                .onEnded { _ in
                    // When drag ends, reset states
                    dragInProgress = false
                    pullDistance = 0

                    // If user was scrolling down, hide the hint
                    if !isScrollingUp && showScrollUpHint && !isLoadingOlderMessages {
                        withAnimation {
                            showScrollUpHint = false
                        }
                    }
                }
        )
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            // Track scroll direction by comparing with previous value
            if !dragInProgress {
                isScrollingUp = value < previousScrollOffset

                // Hide hint when scrolling down
                if !isScrollingUp && showScrollUpHint && !isLoadingOlderMessages {
                    withAnimation {
                        showScrollUpHint = false
                    }
                }
            }

            // Store current value for next comparison
            previousScrollOffset = value
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
            MessageView(text: "Hi everyone! Before we sart, I just want you to know how grateful I am for you guys! I'm so excited to get to know you all a bit better here and find out more about you!", imageName: "avb", isUser: false)
            MessageView(text: "Funny story when I started my blog back in 2010, it was actually an idea that came about because Baxter told me I should do it to find someone who cares...all about the fashion I would talk to him about 😂 I totally agreed! I wanted to share with people who love what I love! So..I'm so happy to meet you here! ", imageName: "avb", isUser: false)
            MessageView(text: "I'm thinking this forum is a great place to share the quick things that come to mind across everyday and please let me know what you would like to see here!", imageName: "avb", isUser: false)

            // Fourth message with ID
            VStack(alignment: .trailing) {
                HStack {
                    Image("avb").resizable().scaledToFill().frame(width: 40, height: 40).clipShape(.circle)
                    Text("First up I bought a beautiful veronica Beard suede chore coat this year and I paid full price because I really thought it would sell out. It's $800 off today! Here's the original video I posted about it: https://liketk.it/554dh.")
                        .foregroundColor(.gray)
                        .padding(10)
                        .background(Color(red: 249/255, green: 249/255, blue: 251/255))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(red: 226/255, green: 227/255, blue: 233/255), lineWidth: 1)
                        )
                        .cornerRadius(8)
                        .id(animatedMessageID)

                }
//                .padding(.leading, 40)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            MessageView(text: "It's a classic piece very elegant and very on trend, yet timeless. this is perfect for the Americana ranch trend and is also stunning for the English countryside...and also football games. It is so fine..", imageName: "avb", isUser: false)
            MessageView(text: "tell me all about it.", imageName: "avb", isUser: false)
            MessageView(text: "Ok team, the new Zara collection is a good one and I just found this dress (that's very Valentino with a nautical style collar. It's $119 and I've never checked out so fast. Y'all know how Zara sells out in 5 seconds. This piece looks amazing online - flip the pics. Long sleeves but a mini...goes with so many pieces and places. Eeee can't arrive soon enough!", imageName: "avb", isUser: false)

            MessageView(text: "Also my girls Easter shoes are on sale for $16!", imageName: "avb", isUser: false)
                .id(seventhMessageActualID)

            MessageView(text: "https://liketk.it/59qad?product=da12345.", imageName: "avb", isUser: false)
            MessageView(text: "Aaaand pulled the New Balance x Miu Miu for you. Actually to ways to get the look! Such finds https://liketk.it/5cAaM.", imageName: "avb", isUser: false)
            MessageView(text: "Ok this isn't my LTK post but I had to share because of how she styled the napkins! 😍 SUCH an amazing good hack! That table looks amazing. https://liketik.t/5cDRn", imageName: "avb", isUser: false)
//            MessageView(text: "But I'll keep trying", imageName: "avb", isUser: false)
//            MessageView(text: "This message is just to let you know that I am still working on this project.", imageName: "avb", isUser: false)
//            MessageView(text: "And now, I am ready to launch!", imageName: "avb", isUser: false)
//            MessageView(text: "blah blah blah", imageName: "avb", isUser: false)
//            MessageView(text: "oh look I forgot a message", imageName: "avb", isUser: false)
//            MessageView(text: "oh look I forgot a message", imageName: "avb", isUser: false)

            // Last message with ID
            MessageView(text: "Just came across this little kids tee that says kickin' it with mom with a cute cowboy boot and it's $6! I'm kind of obsessed. Going into summer and being Mother's Day weekend this is a yes: Short-sleeved Graphic T-shirt for Toddler Boys | Old Navy", imageName: "avb", isUser: false)
                .id(lastMessageID)

            // Space for hint - make sure there's room for it
            Color.clear.frame(height: 40)
        }
        .padding(10)
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
                        // Initialize as scrolling up since that's the initial hint state
                        self.isScrollingUp = true
                    }
                    self.didInitialScrollSequence = true
                }
            }
        }
    }

    func handleRefreshLogic() {
        // Simulate loading data
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // In a real app, you'd add new messages to the top of your data source here.

            withAnimation {
                isLoadingOlderMessages = false // Hide the loading indicator
            }

            // Scroll back to the bottom to show the most recent messages
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.easeInOut) {
                    scrollViewProxy?.scrollTo(lastMessageID, anchor: .bottom)
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
            
            HStack(alignment: .top) {  // Added alignment: .top here
                if !isUser {
                    Image(imageName)
                        .resizable().scaledToFill().frame(width: 40, height: 40).clipShape(.circle)
                }
                Text(text)
                    .foregroundColor(.gray)
                    .padding(10)
                    .background(Color(red: 249/255, green: 249/255, blue: 251/255))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 226/255, green: 227/255, blue: 233/255), lineWidth: 1)
                    )
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
