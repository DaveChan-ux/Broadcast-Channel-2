import SwiftUI
import EffectsLibrary
import RiveRuntime


struct ContentView: View {
    @State private var config = ConfettiConfig(
        content: [
            .emoji("❤️", 1),
            .emoji("❤️", 1),
            .emoji("❤️", 1)
        ],
        //        backgroundColor: .blue,
        intensity: .low,
        lifetime: .short,
        //        initialVelocity: .medium,
        fadeOut: .fast,
        spreadRadius: .medium,
        //        emitterPosition: .bottom,
        fallDirection: .upwards
    )

    @State private var showConfetti = false // Add this state variable
    @State private var confettiOpacity = 0.0 // Add this for opacity control

    //Rive
    @StateObject private var stateChanger = RiveViewModel(fileName: "heartFloat3", stateMachineName: "State Machine 1" ,fit: .contain)
    @State private var heartButtonFrame: CGRect = .zero
    @State private var showHeartAnimation = false // To control visibility

    // Create feedback generator
    let impactGenerator = UIImpactFeedbackGenerator(style: .medium)

    func playHapticSequence() {
        // Play initial haptic
        impactGenerator.impactOccurred()

        // Create 9 more haptics with delays
        for i in 1...9 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.1) {
                self.impactGenerator.impactOccurred()
            }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Image("applebg1") //gradient background of the app
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .opacity(0.5)  // Adjust this value as needed

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {

                        // Convo
                        VStack(alignment: .trailing) {

                            HStack {
                                Text("Hey happy Monday")
                                    .foregroundColor(.gray)
                                //                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(Color.gray, lineWidth: 1)
//                                    )

                                Image("dctc")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
//                                    )

                            }
                            .padding(.leading, 40)

                        } // end Convo
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        // Convo
                        VStack(alignment: .trailing) {

                            HStack {
                                Text("Hey happy Monday")
                                    .foregroundColor(.gray)
                                //                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(Color.gray, lineWidth: 1)
//                                    )

                                Image("dctc")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
//                                    )

                            }
                            .padding(.leading, 40)

                        } // end Convo
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        // Convo
                        VStack(alignment: .trailing) {

                            HStack {
                                Text("Hey happy Monday")
                                    .foregroundColor(.gray)
                                //                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(Color.gray, lineWidth: 1)
//                                    )

                                Image("dctc")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
//                                    )

                            }
                            .padding(.leading, 40)

                        } // end Convo
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        // Convo
                        VStack(alignment: .trailing) {

                            HStack {
                                Text("Man what a crazy weekend.")
                                    .foregroundColor(.gray)
                                //                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(Color.gray, lineWidth: 1)
//                                    )

                                Image("dctc")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
//                                    )

                            }
                            .padding(.leading, 40)

                        } // end Convo
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        // Convo
                        VStack(alignment: .trailing) {

                            HStack {
                                Text("So what did you thnk of the new car.")
                                    .foregroundColor(.gray)
                                //                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(Color.gray, lineWidth: 1)
//                                    )

                                Image("dctc")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
//                                    )

                            }
                            .padding(.leading, 40)

                        } // end Convo
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        // Convo
                        VStack(alignment: .trailing) {

                            HStack {
                                Text("You can tell me the truth feelings won't be hurt")
                                    .foregroundColor(.gray)
                                //                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(Color.gray, lineWidth: 1)
//                                    )

                                Image("dctc")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
//                                    )

                            }
                            .padding(.leading, 40)

                        } // end Convo
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        // Convo
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Image("avb")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
//                                    )
                                Text("really.")
                                    .foregroundColor(.gray)
                                //                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(Color.gray, lineWidth: 1)
//                                    )
                            }
                            .padding(.trailing, 40)
                        }

                        // Convo
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Image("avb")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
//                                    )
                                Text("Sheesh yeah right I know you.")
                                    .foregroundColor(.gray)
                                //                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(Color.gray, lineWidth: 1)
//                                    )
                            }
                            .padding(.trailing, 40)
                        }

                        // Convo
                        VStack(alignment: .trailing) {

                            HStack {
                                Text("Can Buddy and I come visit soon? Like we miss your place a lot")
                                    .foregroundColor(.gray)
                                //                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(Color.gray, lineWidth: 1)
//                                    )

                                Image("dctc")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
//                                    )

                            }
                            .padding(.leading, 40)

                        } // end Convo
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        // Convo with Heart Button
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Image("avb")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
                                    )

                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Well of course! you're welcome to visit anytime! We can't wait to see you!")
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                        .padding(10)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                    HStack {
                                        Button("❤️") {
                                            stateChanger.triggerInput("beat")
                                            showHeartAnimation = true

                                            // Hide animation after it completes
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                                showHeartAnimation = false
                                            }
                                        }
                                        .padding(8)
                                        .background(Color.white)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                        .background(
                                            GeometryReader { geometry -> Color in
                                                DispatchQueue.main.async {
                                                    self.heartButtonFrame = geometry.frame(in: .global)
                                                }
                                                return Color.clear
                                            }
                                        )

                                        Text("👍")
                                        .padding(8)
                                        .background(Color.white)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)

                                        Text("🔥")
                                            .padding(8)
                                        .background(Color.white)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)

                                        Text("😊")
                                            .padding(8)
                                        .background(Color.white)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)

                                    }//end button HStack

                                }//end VStack of text and emoji buttons

                            }//end HStack of profile and text
                            .padding(.trailing, 40)

                            // Heart button - with position tracking
//                            HStack {
//                                Button("❤️") {
//                                    stateChanger.triggerInput("beat")
//                                    showHeartAnimation = true
//
//                                    // Hide animation after it completes
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//                                        showHeartAnimation = false
//                                    }
//                                }
//                                .padding()
//                                .background(Color.gray)
//                                .foregroundColor(.white)
//                                .cornerRadius(8)
//                                .background(
//                                    GeometryReader { geometry -> Color in
//                                        DispatchQueue.main.async {
//                                            self.heartButtonFrame = geometry.frame(in: .global)
//                                        }
//                                        return Color.clear
//                                    }
//                                )
//                            }
                        }

                        // Convo
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Image("avb")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
                                Text("And of course, bring your friends!It's a party afterall!")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(Color.gray, lineWidth: 1)
//                                    )
                            }
                            .padding(.trailing, 40)
//                            .overlay{
//                                stateChanger.view()
//                                    .frame(width: 300, height: 300)
//                                }


                            
                        }



                        // Convo
                        // Convo
                        VStack(alignment: .trailing) {
                            ZStack {
                                //                            ConfettiView(config: config)
                                //                                .opacity(confettiOpacity)
                                //                                .animation(.easeOut(duration: 1.0), value: confettiOpacity)

                                Button(action: {
                                    // Trigger haptic sequence
                                    playHapticSequence()

                                    showConfetti = true
                                    confettiOpacity = 1.0 // Fade in

                                    // Start fading out after a delay
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        withAnimation {
                                            confettiOpacity = 0.0 // Fade out
                                        }
                                    }

                                    // Reset after animation completes
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                        showConfetti = false
                                    }
                                }) {
                                    HStack(alignment: .top) {
                                        Text("Ok! Don't say I didn't warn you. I have lots of friends are they're a crazy bunch.")
                                            .foregroundColor(.gray)
                                            .lineLimit(nil)
                                            .multilineTextAlignment(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(10)
                                            .background(Color.white)
                                            .cornerRadius(8)
//                                            .overlay(
//                                                RoundedRectangle(cornerRadius: 8)
//                                                    .stroke(Color.gray, lineWidth: 1)
//                                            )

                                        Image("dctc")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 40, height: 40)
                                            .clipShape(.circle)
//                                            .overlay(
//                                                Circle()
//                                                    .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
//                                            )
                                    }
                                    .padding(.leading, 40)
                                }

                                HStack {
                                    ConfettiView(config: config)
                                        .opacity(confettiOpacity)
                                        .animation(.easeOut(duration: 1.0), value: confettiOpacity)
                                }
                                .padding(.leading, 50)

                            }
                        } // end VStack
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(10)// end Vstack

                    .overlay(
                        GeometryReader { geometry in
                            stateChanger.view()
                                .frame(width: 300, height: 300)
                                .allowsHitTesting(false)
//                                .opacity(stateChanger.isPlaying ? 1 : 0)
                                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                                .zIndex(100)
                        }
                    )

                } //end scrollview
                .navigationTitle("Chat with Amber")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.regularMaterial, for: .navigationBar)                .toolbar {  // Add here
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

                if showHeartAnimation && heartButtonFrame != .zero {
                                    stateChanger.view()
                                        .frame(width: 300, height: 300)
                                        .position(
                                            x: heartButtonFrame.midX,
                                            y: heartButtonFrame.minY - 200
                                        )
                                        .zIndex(100)
                                        .allowsHitTesting(false)
                                }


            } // end Zstack
        } //end navstack
        .onAppear {
            impactGenerator.prepare()
        }

    }//end scrollview



}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
