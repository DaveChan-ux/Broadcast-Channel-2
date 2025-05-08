import SwiftUI

extension Color {
    static let customLightGray = Color(red: 230/255, green: 230/255, blue: 230/255)
}

struct ContentView: View {

    // Change to wiggle animation state
    @State private var wiggleOffset: CGFloat = 0
    @State private var wiggleCount = 0
    let maxWiggleCount = 3  // Increased for a more noticeable effect

    // Keep the scroll stage state
    @State private var scrollStage = 0

    var body: some View {

        NavigationStack {
            ZStack {
                Image("applebg1")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.5)  // Adjust this value as needed

                // Wrap ScrollView in a ScrollViewReader
                ScrollView {
                    ScrollViewReader { proxy in
                        VStack(alignment: .leading, spacing: 16) {
                            // Add an empty view at the top with an ID for scrolling
                            Color.clear.frame(height: 1)
                                .id("topMessage")

                            // First message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("Hey happy Monday")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Second message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("Hey happy Monday")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Third message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("Hey happy Monday")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Message to animate - changed to wiggle animation
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("Man what a crazy weekend.")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                        .offset(x: wiggleOffset) // Add horizontal offset for wiggle
                                        .animation(
                                            Animation.easeInOut(duration: 0.15), // Faster animation for wiggle
                                            value: wiggleOffset
                                        )
                                        .id("animatedMessage")

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Fourth message
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Image("avb")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)


                                    Text("really.")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                }
                                .padding(.trailing, 40)
                            }

                            // Fifth message
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Image("avb")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)


                                    Text("tell me all about it.")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                }
                                .padding(.trailing, 40)
                            }

                            // Sixth message
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Image("avb")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)


                                    Text("I had a pretty good weekend too.")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                }
                                .padding(.trailing, 40)
                            }

                            // Seventh message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("Man seattle gets so nice around this time of year.")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Eigth message
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Image("avb")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)


                                    Text("This year it got warm quickly. Last year was pretty depressing.")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                }
                                .padding(.trailing, 40)
                            }

                            // Ninth message
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Image("avb")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)


                                    Text("WhatI like about this year is that I have a lot of free time.")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                }
                                .padding(.trailing, 40)
                            }

                            // Tenth message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("Sometime I wonder if I should be interested in something else")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)


                            // Eleventh message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("But I'll keep trying")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Twelth message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("This message is just to let you know that I am still working on this project.")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Thirteeth message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("And now, I am ready to launch!")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Fourtheeth message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("blah blah blah")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Fifteenth message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("oh look I forgot a message")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Sixteenth message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("oh look I forgot a message")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Seventeeth message
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("oh look I forgot a message")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)

                                    Image("dctc")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                }
                                .padding(.leading, 40)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                            // Add a marker at the bottom of the feed
                            Color.clear.frame(height: 1)
                                .id("bottomMessage")
                        }
                        .padding(10) // end VStack
                        .onAppear {
                            // Step 1: First scroll to the bottom immediately
                            proxy.scrollTo("bottomMessage", anchor: .bottom)

                            // Step 2: After a delay, scroll to the target message
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                withAnimation(.easeInOut(duration: 0.8)) {
                                    proxy.scrollTo("animatedMessage", anchor: .center)
                                    scrollStage = 1
                                }
                            }

                            // Step 3: Start the wiggle animation after the scroll completes
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                                self.wiggleAnimation()
                            }
                        }
                    } // end ScrollViewReader
                } // end ScrollView
                .navigationTitle("Chat with Amber")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.regularMaterial, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            // Your action here
                        }) {
                            Image(systemName: "chart.bar.fill")
                                .foregroundColor(Color.gray)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            // Your action here
                        }) {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color.gray)
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            // Your action here
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
            } // end ZStack
        } // end NavigationStack
    }

    // Replaced flash animation with wiggle animation
    private func wiggleAnimation() {
        // Only continue if we haven't reached max wiggle count
        guard wiggleCount < maxWiggleCount else { return }

        // Wiggle to the right
        wiggleOffset = 15

        // Schedule wiggle to the left
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.wiggleOffset = -15

            // Schedule return to center
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.wiggleOffset = 0
                self.wiggleCount += 1

                // Schedule next wiggle with a small delay
                if self.wiggleCount < self.maxWiggleCount {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.wiggleAnimation()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
