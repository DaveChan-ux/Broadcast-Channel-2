//confetti version

import SwiftUI
import ConfettiSwiftUI


struct PostContent: ViewModifier { //custom post content card modifier
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let textColor: Color
    
    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .foregroundColor(textColor)
    }
}

struct CommentReply: ViewModifier { //custom comment reply modifier
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let padding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .padding(.top, padding)
        
    }
    
}

struct EmojiReply: ViewModifier { //custom emoji reply modifier
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let padding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: 40, height: 20, alignment: .center)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .padding(padding)
            .overlay(RoundedRectangle(cornerRadius:80).stroke(.gray, lineWidth:1))
        
    }
    
}

extension View { // extension of post content card modifier, a method all views can use
    func postContent(color: Color, radius: CGFloat, textColor: Color) -> some View {
        self.modifier(PostContent(backgroundColor: color, cornerRadius: radius, textColor: textColor)) //use this for flexibility to add custom styling
    }
    
    func postContent2()-> some View {
        self.modifier(PostContent(backgroundColor: .blue, cornerRadius: 8, textColor: .yellow)) //use this one for hardcoded default value
    }
    
    func commentReply(color: Color) -> some View { // extension of reply modifier
        self.modifier(CommentReply(backgroundColor: color, cornerRadius: 80, padding:8))
    }
    
    func emojiReply() -> some View { // extension of emoji reply modifier
        self.modifier(EmojiReply(backgroundColor: .white, cornerRadius: 80, padding:0)) //hardcoded default value
    }
    

}

struct ContentView: View {
    @State private var thumbsUpCounter = 0
    @State private var thumbsUpCounter1 = 0
    @State private var thumbsUpCounter2 = 0
    @State private var thumbsUpCounter3 = 0

    @State private var heartCounter = 0
    @State private var heartCounter1 = 0
    @State private var heartCounter2 = 0
    @State private var heartCounter3 = 0

    @State private var fireCounter = 0
    @State private var fireCounter1 = 0
    @State private var fireCounter2 = 0
    @State private var fireCounter3 = 0

    @State private var smileCounter = 0
    @State private var smileCounter1 = 0
    @State private var smileCounter2 = 0
    @State private var smileCounter3 = 0

    var body: some View {

        VStack {

            // Header nav ---------------------------------------------------------
                    VStack(alignment: .leading, spacing: 0) { //header nav

                        HStack(spacing: 0) { //time, need to left align this
                             Text("9:41")
                               .font(Font.custom("SF Pro Text", size: 15).weight(.semibold))
                               .lineSpacing(20)
                               .foregroundColor(.black)
                           }
                           .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
//                           .offset(x: -139.50, y: 0.50)
                         .frame(width: 375, height: 44)
//                           .resizable()
//                           .scaledToFit()
//                         .background(Color(.red))

                           HStack(spacing: 10) { // profile image + name + follower count

                             HStack(spacing: 10) { //profile image
                                 Image("avb")
                                     .resizable()
                                     .scaledToFill()
                                     .frame(width: 40, height: 40)
                                     .clipShape(.circle)
                                     .overlay(
                                         Circle()
                                             .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
                                     )

                             VStack(alignment: .leading, spacing: 0) { //name + follower count
                                 Text("karinastylediaries")
                                   .font(Font.custom("Sofia Pro", size: 14).weight(.bold))
                                   .lineSpacing(22)
                                   .foregroundColor(.black)

                                 Text("32.5K followers")
                                   .font(Font.custom("Sofia Pro", size: 12))
                                   .tracking(0.24)
                                   .lineSpacing(20.40)
                                   .foregroundColor(Color(red: 0.32, green: 0.32, blue: 0.32))
                               }
                             }
                           }

                       }
                       .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
                       .background(Color(.red))
//                       .background(Color(red: 0.21, green: 0.22, blue: 0.24))
                       .ignoresSafeArea()

            ScrollView {
                
                VStack { //parent container
                    
                    VStack(alignment: .leading, spacing: 0) { // all 4 boxes

// BOX 1 -----------------------------------------------------------------------------------

                        VStack(alignment: .leading, spacing: 0) {  // box 1 + replies
                            //Rectangle() // box 1
//                            Text("Box 1")
                            ContentUnavailableView {
                                Label("No Content", systemImage: "photo")
                            }
                            .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
//                                .overlay(
//                                    Image("missy")
//                                        .resizable()
//                                        .scaledToFit()
//                                    //.aspectRatio(contentMode: .fill)
//                                )
                                .postContent(color: .black, radius: 8, textColor: .yellow)
                            
                            HStack(spacing: 4) { //emoji replies
                                
//                                HStack(spacing: 1) {
//                                    Text("👍")
//                                        .font(Font.custom("Sofia Pro", size: 8))
//                                        .lineSpacing(24)
//                                }
//                                .emojiReply()
                            
                            HStack(spacing: 2) {
                                        
                                        Button(action: { //wrap each emoji with a button
                                            thumbsUpCounter += 1
                                        }) {
                                            HStack(spacing: 1) {
                                                Text("👍")
                                                    .font(Font.custom("Sofia Pro", size: 8))
                                            }
                                            .emojiReply()
                                        }
                                        .confettiCannon(counter: $thumbsUpCounter,
                                                        num: 25,
                                                        confettis: [.text("👍")],
                                                        confettiSize: 10.0,
                                                        rainHeight: 600.0,
                                                        openingAngle: Angle(degrees: 0),
                                                        closingAngle: Angle(degrees: 180),
                                                        radius: 100.0,
                                                        repetitions: 0)
                                       // .background(Color.red)
                                    }
                                
                            HStack(spacing: 2) {
                                    
                                    Button(action: { //wrap each emoji with a button
                                        heartCounter += 1
                                    }) {
                                        HStack(spacing: 1) {
                                            Text("❤️")
                                                .font(Font.custom("Sofia Pro", size: 8))
                                        }
                                        .emojiReply()
                                    }
                                    .zIndex(1) // Add this line to bring confetti to front
                                    .confettiCannon(counter: $heartCounter,
                                                    num: 25,
                                                    confettis: [.text("❤️")],
                                                    confettiSize: 10.0,
                                                    rainHeight: 600.0,
                                                    openingAngle: Angle(degrees: 0),
                                                    closingAngle: Angle(degrees: 180),
                                                    radius: 100.0,
                                                    repetitions: 0)
                                    
                                   // .background(Color.red)
                                }
                                
                           // HStack(spacing: 1) {
                             //       Text("🔥")
                               //         .font(Font.custom("Sofia Pro", size: 8))
                                 //       .lineSpacing(24)
                               // }
                               // .emojiReply()
                                
                            HStack(spacing: 2) {
                                        
                                        Button(action: { //wrap each emoji with a button
                                            fireCounter += 1
                                        }) {
                                            HStack(spacing: 1) {
                                                Text("🔥")
                                                    .font(Font.custom("Sofia Pro", size: 8))
                                            }
                                            .emojiReply()
                                        }
                                        .zIndex(100) // Add this line to bring confetti to front
                                        .confettiCannon(counter: $fireCounter,
                                                        num: 25,
                                                        confettis: [.text("🔥")],
                                                        confettiSize: 10.0,
                                                        rainHeight: 600.0,
                                                        openingAngle: Angle(degrees: 0),
                                                        closingAngle: Angle(degrees: 180),
                                                        radius: 100.0,
                                                        repetitions: 0)
                                       
                                       // .background(Color.red)
                                    }
                                
                           // HStack(spacing: 1) {
                             //       Text("😊")
                              //          .font(Font.custom("Sofia Pro", size: 8))
                                //        .lineSpacing(24)
                               // }
                               // .emojiReply()
                                
                                
                                
                            HStack(spacing: 2) {
                                        
                                        Button(action: { //wrap each emoji with a button
                                            smileCounter += 1
                                        }) {
                                            HStack(spacing: 1) {
                                                Text("🙂")
                                                    .font(Font.custom("Sofia Pro", size: 8))
                                            }
                                            .emojiReply()
                                        }
                                        .confettiCannon(counter: $smileCounter,
                                                        num: 25,
                                                        confettis: [.text("🙂")],
                                                        confettiSize: 10.0,
                                                        rainHeight: 600.0,
                                                        openingAngle: Angle(degrees: 0),
                                                        closingAngle: Angle(degrees: 180),
                                                        radius: 100.0,
                                                        repetitions: 0)
                                        .zIndex(2) // Add this line to bring confetti to front
                                        //.background(Color.red)
                                    }
                                
                            }
                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 8))
                            .background(Color(.yellow))

//                            HStack(spacing: 1) { //replies
//                                Text("12")
//                                    .font(Font.custom("Sofia Pro", size: 16))
//                                    .lineSpacing(24)
//                                    .foregroundColor(Color(red: 0.71, green: 0.05, blue: 0.60))
//                                
//                            }
//                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
//                            .commentReply(color: .blue)
                            
                        }
                        .background(Color(.green))


// BOX 2 -----------------------------------------------------------------------------------
                        VStack(alignment: .leading, spacing: 0) { // box 2 + replies
                            // Rectangle()
                            Text("Box 2")
                                .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                                .overlay(
                                    Image("lordbusiness")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                )
                                .modifier(PostContent(backgroundColor: .black, cornerRadius: 8, textColor: .white)) //using this if I did not want to use the extension view
                            
                            HStack(spacing: 4) { //emoji replies
                                
//                                HStack(spacing: 1) {
//                                    Text("👍")
//                                        .font(Font.custom("Sofia Pro", size: 8))
//                                        .lineSpacing(24)
//                                }
//                                .emojiReply()
                            
                            HStack(spacing: 2) {
                                        
                                        Button(action: { //wrap each emoji with a button
                                            thumbsUpCounter1 += 1
                                        }) {
                                            HStack(spacing: 1) {
                                                Text("👍")
                                                    .font(Font.custom("Sofia Pro", size: 8))
                                            }
                                            .emojiReply()
                                        }
                                        .confettiCannon(counter: $thumbsUpCounter1,
                                                        num: 25,
                                                        confettis: [.text("👍")],
                                                        confettiSize: 10.0,
                                                        rainHeight: 600.0,
                                                        openingAngle: Angle(degrees: 0),
                                                        closingAngle: Angle(degrees: 360),
                                                        radius: 100.0,
                                                        repetitions: 0)
                                        .zIndex(1) // Add this line to bring confetti to front
                                       // .background(Color.red)
                                    }
                                
                            HStack(spacing: 2) {
                                    
                                    Button(action: { //wrap each emoji with a button
                                        heartCounter1 += 1
                                    }) {
                                        HStack(spacing: 1) {
                                            Text("❤️")
                                                .font(Font.custom("Sofia Pro", size: 8))
                                        }
                                        .emojiReply()
                                    }
                                    .confettiCannon(counter: $heartCounter1,
                                                    num: 25,
                                                    confettis: [.text("❤️")],
                                                    confettiSize: 10.0,
                                                    rainHeight: 600.0,
                                                    openingAngle: Angle(degrees: 0),
                                                    closingAngle: Angle(degrees: 360),
                                                    radius: 100.0,
                                                    repetitions: 0)
                                    .zIndex(1) // Add this line to bring confetti to front
                                   // .background(Color.red)
                                }
                                
                           // HStack(spacing: 1) {
                             //       Text("🔥")
                               //         .font(Font.custom("Sofia Pro", size: 8))
                                 //       .lineSpacing(24)
                               // }
                               // .emojiReply()
                                
                            HStack(spacing: 2) {
                                        
                                        Button(action: { //wrap each emoji with a button
                                            fireCounter1 += 1
                                        }) {
                                            HStack(spacing: 1) {
                                                Text("🔥")
                                                    .font(Font.custom("Sofia Pro", size: 8))
                                            }
                                            .emojiReply()
                                        }
                                        .confettiCannon(counter: $fireCounter1,
                                                        num: 25,
                                                        confettis: [.text("🔥")],
                                                        confettiSize: 10.0,
                                                        rainHeight: 600.0,
                                                        openingAngle: Angle(degrees: 0),
                                                        closingAngle: Angle(degrees: 360),
                                                        radius: 100.0,
                                                        repetitions: 0)
                                        .zIndex(1) // Add this line to bring confetti to front
                                       // .background(Color.red)
                                    }
                                
                           // HStack(spacing: 1) {
                             //       Text("😊")
                              //          .font(Font.custom("Sofia Pro", size: 8))
                                //        .lineSpacing(24)
                               // }
                               // .emojiReply()
                                
                                
                                
                            HStack(spacing: 2) {
                                        
                                        Button(action: { //wrap each emoji with a button
                                            smileCounter1 += 1
                                        }) {
                                            HStack(spacing: 1) {
                                                Text("🙂")
                                                    .font(Font.custom("Sofia Pro", size: 8))
                                            }
                                            .emojiReply()
                                        }
                                        .confettiCannon(counter: $smileCounter1,
                                                        num: 25,
                                                        confettis: [.text("🙂")],
                                                        confettiSize: 10.0,
                                                        rainHeight: 600.0,
                                                        openingAngle: Angle(degrees: 0),
                                                        closingAngle: Angle(degrees: 360),
                                                        radius: 100.0,
                                                        repetitions: 0)
                                        .zIndex(2) // Add this line to bring confetti to front
                                       // .background(Color.red)
                                    }
                                
                            }
                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 8))
                            //.background(Color.green)
                            //.frame(maxWidth: .infinity, minHeight: 185, maxHeight: 185)
                        }
                        //.frame(maxWidth: .infinity, minHeight: 185, maxHeight: 185)

// BOX 3 -----------------------------------------------------------------------------------

                        HStack(spacing: 1) { //aligns box 3 to the right
                            Spacer()


// BOX 3 -----------------------------------------------------------------------------------
                            VStack(alignment: .leading, spacing: 0) {   // box 3 + replies
                                // Rectangle()
                                Text("Box 3")
                                    .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                                    .overlay(
                                        Image("venom")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    )
                                    .postContent2() //uses the default values
                                
                                HStack(spacing: 4) { //emoji replies
                                    
    //                                HStack(spacing: 1) {
    //                                    Text("👍")
    //                                        .font(Font.custom("Sofia Pro", size: 8))
    //                                        .lineSpacing(24)
    //                                }
    //                                .emojiReply()
                                
                                HStack(spacing: 2) {
                                            
                                            Button(action: { //wrap each emoji with a button
                                                thumbsUpCounter2 += 1
                                            }) {
                                                HStack(spacing: 1) {
                                                    Text("👍")
                                                        .font(Font.custom("Sofia Pro", size: 8))
                                                }
                                                .emojiReply()
                                            }
                                            .confettiCannon(counter: $thumbsUpCounter2,
                                                            num: 25,
                                                            confettis: [.text("👍")],
                                                            confettiSize: 10.0,
                                                            rainHeight: 600.0,
                                                            openingAngle: Angle(degrees: 0),
                                                            closingAngle: Angle(degrees: 360),
                                                            radius: 100.0,
                                                            repetitions: 0)
                                            .zIndex(1) // Add this line to bring confetti to front
                                           // .background(Color.red)
                                        }
                                    
                                HStack(spacing: 2) {
                                        
                                        Button(action: { //wrap each emoji with a button
                                            heartCounter2 += 1
                                        }) {
                                            HStack(spacing: 1) {
                                                Text("❤️")
                                                    .font(Font.custom("Sofia Pro", size: 8))
                                            }
                                            .emojiReply()
                                        }
                                        .confettiCannon(counter: $heartCounter2,
                                                        num: 25,
                                                        confettis: [.text("❤️")],
                                                        confettiSize: 10.0,
                                                        rainHeight: 600.0,
                                                        openingAngle: Angle(degrees: 0),
                                                        closingAngle: Angle(degrees: 360),
                                                        radius: 100.0,
                                                        repetitions: 0)
                                        .zIndex(1) // Add this line to bring confetti to front
                                       // .background(Color.red)
                                    }
                                    
                               // HStack(spacing: 1) {
                                 //       Text("🔥")
                                   //         .font(Font.custom("Sofia Pro", size: 8))
                                     //       .lineSpacing(24)
                                   // }
                                   // .emojiReply()
                                    
                                HStack(spacing: 2) {
                                            
                                            Button(action: { //wrap each emoji with a button
                                                fireCounter2 += 1
                                            }) {
                                                HStack(spacing: 1) {
                                                    Text("🔥")
                                                        .font(Font.custom("Sofia Pro", size: 8))
                                                }
                                                .emojiReply()
                                            }
                                            .confettiCannon(counter: $fireCounter2,
                                                            num: 25,
                                                            confettis: [.text("🔥")],
                                                            confettiSize: 10.0,
                                                            rainHeight: 600.0,
                                                            openingAngle: Angle(degrees: 0),
                                                            closingAngle: Angle(degrees: 360),
                                                            radius: 100.0,
                                                            repetitions: 0)
                                            .zIndex(1) // Add this line to bring confetti to front
                                           // .background(Color.red)
                                        }
                                    
                               // HStack(spacing: 1) {
                                 //       Text("😊")
                                  //          .font(Font.custom("Sofia Pro", size: 8))
                                    //        .lineSpacing(24)
                                   // }
                                   // .emojiReply()
                                    
                                    
                                    
                                HStack(spacing: 2) {
                                            
                                            Button(action: { //wrap each emoji with a button
                                                smileCounter2 += 1
                                            }) {
                                                HStack(spacing: 1) {
                                                    Text("🙂")
                                                        .font(Font.custom("Sofia Pro", size: 8))
                                                }
                                                .emojiReply()
                                            }
                                            .confettiCannon(counter: $smileCounter2,
                                                            num: 25,
                                                            confettis: [.text("🙂")],
                                                            confettiSize: 10.0,
                                                            rainHeight: 600.0,
                                                            openingAngle: Angle(degrees: 0),
                                                            closingAngle: Angle(degrees: 360),
                                                            radius: 100.0,
                                                            repetitions: 0)
                                            .zIndex(2) // Add this line to bring confetti to front
                                            //.background(Color.red)
                                        }
                                    
                                }
                                .padding(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 8))
//                                HStack(spacing: 1) { //replies
//                                    Text("14")
//                                        .font(Font.custom("Sofia Pro", size: 16))
//                                        .lineSpacing(24)
//                                        .foregroundColor(Color(red: 0.71, green: 0.05, blue: 0.60))
//                                }
//                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
//                                .commentReply(color: .blue)
                            }
                            
                        }
// BOX 4 -----------------------------------------------------------------------------------
                        HStack(spacing: 1) { //aligns box 4 to the right
                            Spacer()
// BOX 4 -----------------------------------------------------------------------------------
                            VStack(alignment: .leading, spacing: 0) { // box 4 + replies
                                // Rectangle()
                                Text("Box 4")
                                    .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                                    .overlay(
                                        Image("venom")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    )
                                    .postContent2() //uses the default values
                                
                                HStack(spacing: 4) { //emoji replies
                                    
    //                                HStack(spacing: 1) {
    //                                    Text("👍")
    //                                        .font(Font.custom("Sofia Pro", size: 8))
    //                                        .lineSpacing(24)
    //                                }
    //                                .emojiReply()
                                
                                HStack(spacing: 2) {
                                            
                                            Button(action: { //wrap each emoji with a button
                                                thumbsUpCounter3 += 1
                                            }) {
                                                HStack(spacing: 1) {
                                                    Text("👍")
                                                        .font(Font.custom("Sofia Pro", size: 8))
                                                }
                                                .emojiReply()
                                            }
                                            .confettiCannon(counter: $thumbsUpCounter3,
                                                            num: 25,
                                                            confettis: [.text("👍")],
                                                            confettiSize: 10.0,
                                                            rainHeight: 600.0,
                                                            openingAngle: Angle(degrees: 0),
                                                            closingAngle: Angle(degrees: 360),
                                                            radius: 100.0,
                                                            repetitions: 0)
                                            .zIndex(1) // Add this line to bring confetti to front
                                           // .background(Color.red)
                                        }
                                    
                                HStack(spacing: 2) {
                                        
                                        Button(action: { //wrap each emoji with a button
                                            heartCounter3 += 1
                                        }) {
                                            HStack(spacing: 1) {
                                                Text("❤️")
                                                    .font(Font.custom("Sofia Pro", size: 8))
                                            }
                                            .emojiReply()
                                        }
                                        .confettiCannon(counter: $heartCounter3,
                                                        num: 25,
                                                        confettis: [.text("❤️")],
                                                        confettiSize: 10.0,
                                                        rainHeight: 600.0,
                                                        openingAngle: Angle(degrees: 0),
                                                        closingAngle: Angle(degrees: 360),
                                                        radius: 100.0,
                                                        repetitions: 0)
                                        .zIndex(1) // Add this line to bring confetti to front
                                       // .background(Color.red)
                                    }
                                    
                               // HStack(spacing: 1) {
                                 //       Text("🔥")
                                   //         .font(Font.custom("Sofia Pro", size: 8))
                                     //       .lineSpacing(24)
                                   // }
                                   // .emojiReply()
                                    
                                HStack(spacing: 2) {
                                            
                                            Button(action: { //wrap each emoji with a button
                                                fireCounter3 += 1
                                            }) {
                                                HStack(spacing: 1) {
                                                    Text("🔥")
                                                        .font(Font.custom("Sofia Pro", size: 8))
                                                }
                                                .emojiReply()
                                            }
                                            .confettiCannon(counter: $fireCounter3,
                                                            num: 25,
                                                            confettis: [.text("🔥")],
                                                            confettiSize: 10.0,
                                                            rainHeight: 600.0,
                                                            openingAngle: Angle(degrees: 0),
                                                            closingAngle: Angle(degrees: 360),
                                                            radius: 100.0,
                                                            repetitions: 0)
                                            .zIndex(1) // Add this line to bring confetti to front
                                           // .background(Color.red)
                                        }
                                    
                               // HStack(spacing: 1) {
                                 //       Text("😊")
                                  //          .font(Font.custom("Sofia Pro", size: 8))
                                    //        .lineSpacing(24)
                                   // }
                                   // .emojiReply()
                                    
                                    
                                    
                                HStack(spacing: 2) {
                                            
                                            Button(action: { //wrap each emoji with a button
                                                smileCounter3 += 1
                                            }) {
                                                HStack(spacing: 1) {
                                                    Text("🙂")
                                                        .font(Font.custom("Sofia Pro", size: 8))
                                                }
                                                .emojiReply()
                                            }
                                            .confettiCannon(counter: $smileCounter3,
                                                            num: 25,
                                                            confettis: [.text("🙂")],
                                                            confettiSize: 10.0,
                                                            rainHeight: 600.0,
                                                            openingAngle: Angle(degrees: 0),
                                                            closingAngle: Angle(degrees: 360),
                                                            radius: 100.0,
                                                            repetitions: 0)
                                            .zIndex(2) // Add this line to bring confetti to front
                                            //.background(Color.red)
                                        }
                                    
                                }
                                .padding(EdgeInsets(top: 8, leading: 0, bottom: 4, trailing: 8))
//                              HStack(spacing: 1) { //replies
//                                    Text("14")
//                                        .font(Font.custom("Sofia Pro", size: 16))
//                                        .lineSpacing(24)
//                                        .foregroundColor(Color(red: 0.71, green: 0.05, blue: 0.60))
//                                }
//                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
//                                .commentReply(color: .blue)
                            }
                            
                            
                        }
                    }
                    //.frame(width: 262, height: 559)
                    //.background(Color.yellow)
                }
                .padding()
                //  .offset(x: -50) //this was the only way I could align the entire Vstack to the left
            }
            .zIndex(0)
            .background(Color(.blue))




        }
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
