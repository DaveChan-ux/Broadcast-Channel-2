import SwiftUI

extension Color {
    static let customLightGray = Color(red: 230/255, green: 230/255, blue: 230/255)
}

struct ContentView: View {

    // Add state variables for the animation
    @State private var isFlashing = false
    @State private var flashCount = 0
    let maxFlashCount = 3

    // Add a state to control the scroll sequence
    @State private var scrollStage = 0

    var body: some View {
        
        NavigationStack {
            ZStack {
                Image("applebg1")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.5)  // Adjust this value as neede

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

                            // Message to animate
                            VStack(alignment: .trailing) {
                                HStack {
                                    Text("Man what a crazy weekend.")
                                        .foregroundColor(.gray)
                                        .padding(10)
                                        .background(
                                            // Animate this background
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(isFlashing ? Color.customLightGray : Color.white)
                                                .animation(
                                                    Animation.easeInOut(duration: 0.3)
                                                        .repeatCount(1, autoreverses: true),
                                                    value: isFlashing
                                                )
                                        )
                                        .cornerRadius(8)
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
                                    //                                .frame(maxWidth: .infinity, alignment: .topLeading)
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
                                    //                                .frame(maxWidth: .infinity, alignment: .topLeading)
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
                                    //                                .frame(maxWidth: .infinity, alignment: .topLeading)
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
                                    //                                .frame(maxWidth: .infinity, alignment: .topLeading)
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
                                    //                                .frame(maxWidth: .infinity, alignment: .topLeading)
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

                            // Step 3: Start the flashing animation after the scroll completes
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                                self.flashAnimation()
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

    // Function to control the flash animation
    private func flashAnimation() {
        // Only continue if we haven't reached max flash count
        guard flashCount < maxFlashCount else { return }

        // Toggle flash state
        isFlashing = true

        // Reset after animation duration
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.isFlashing = false
            self.flashCount += 1

            // Schedule next flash with delay
            if self.flashCount < self.maxFlashCount {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.flashAnimation()
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
