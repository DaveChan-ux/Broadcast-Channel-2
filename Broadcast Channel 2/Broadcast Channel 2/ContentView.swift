import SwiftUI

struct PostContent: ViewModifier {
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

struct CommentReply: ViewModifier {
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

struct EmojiReply: ViewModifier {
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let padding: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(width: 40, height: 20, alignment: .center)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .padding(padding)
            .overlay(RoundedRectangle(cornerRadius: 80).stroke(.gray, lineWidth: 1))
    }
}

extension View {
    func postContent(color: Color, radius: CGFloat, textColor: Color) -> some View {
        self.modifier(PostContent(backgroundColor: color, cornerRadius: radius, textColor: textColor))
    }

    func postContent2() -> some View {
        self.modifier(PostContent(backgroundColor: .blue, cornerRadius: 8, textColor: .yellow))
    }

    func commentReply(color: Color) -> some View {
        self.modifier(CommentReply(backgroundColor: color, cornerRadius: 80, padding: 8))
    }

    func emojiReply() -> some View {
        self.modifier(EmojiReply(backgroundColor: .white, cornerRadius: 80, padding: 0))
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
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // BOX 1
                VStack(alignment: .leading, spacing: 0) {
                    Text("Box 1")
                        .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                        .overlay(
                            Image("missy")
                                .resizable()
                                .scaledToFit()
                        )
                        .postContent(color: .black, radius: 8, textColor: .yellow)

                    HStack(spacing: 4) {
                        Button(action: { thumbsUpCounter += 1 }) {
                            Text("👍")
                                .font(Font.custom("Sofia Pro", size: 8))
                                .emojiReply()
                        }

                        Button(action: { heartCounter += 1 }) {
                            Text("❤️")
                                .font(Font.custom("Sofia Pro", size: 8))
                                .emojiReply()
                        }

                        Text("🔥")
                            .font(Font.custom("Sofia Pro", size: 8))
                            .emojiReply()

                        Button(action: { smileCounter += 1 }) {
                            Text("🙂")
                                .font(Font.custom("Sofia Pro", size: 8))
                                .emojiReply()
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 8))
                }

                // BOX 2
                VStack(alignment: .leading, spacing: 0) {
                    Text("Box 2")
                        .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                        .overlay(
                            Image("lordbusiness")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        )
                        .modifier(PostContent(backgroundColor: .black, cornerRadius: 8, textColor: .white))

                    HStack(spacing: 4) {
                        Button(action: { thumbsUpCounter1 += 1 }) {
                            Text("👍")
                                .font(Font.custom("Sofia Pro", size: 8))
                                .emojiReply()
                        }

                        Button(action: { heartCounter1 += 1 }) {
                            Text("❤️")
                                .font(Font.custom("Sofia Pro", size: 8))
                                .emojiReply()
                        }

                        Button(action: { fireCounter1 += 1 }) {
                            Text("🔥")
                                .font(Font.custom("Sofia Pro", size: 8))
                                .emojiReply()
                        }

                        Button(action: { smileCounter1 += 1 }) {
                            Text("🙂")
                                .font(Font.custom("Sofia Pro", size: 8))
                                .emojiReply()
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 8))
                }

                // BOX 3
                HStack(spacing: 1) {
                    Spacer()
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Box 3")
                            .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                            .overlay(
                                Image("venom")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            )
                            .postContent2()

                        HStack(spacing: 4) {
                            Button(action: { thumbsUpCounter2 += 1 }) {
                                Text("👍")
                                    .font(Font.custom("Sofia Pro", size: 8))
                                    .emojiReply()
                            }

                            Button(action: { heartCounter2 += 1 }) {
                                Text("❤️")
                                    .font(Font.custom("Sofia Pro", size: 8))
                                    .emojiReply()
                            }

                            Button(action: { fireCounter2 += 1 }) {
                                Text("🔥")
                                    .font(Font.custom("Sofia Pro", size: 8))
                                    .emojiReply()
                            }

                            Button(action: { smileCounter2 += 1 }) {
                                Text("🙂")
                                    .font(Font.custom("Sofia Pro", size: 8))
                                    .emojiReply()
                            }
                        }
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 8))
                    }
                }

                // BOX 4
                HStack(spacing: 1) {
                    Spacer()
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Box 4")
                            .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                            .overlay(
                                Image("venom")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            )
                            .postContent2()

                        HStack(spacing: 4) {
                            Button(action: { thumbsUpCounter3 += 1 }) {
                                Text("👍")
                                    .font(Font.custom("Sofia Pro", size: 8))
                                    .emojiReply()
                            }

                            Button(action: { heartCounter3 += 1 }) {
                                Text("❤️")
                                    .font(Font.custom("Sofia Pro", size: 8))
                                    .emojiReply()
                            }

                            Button(action: { fireCounter3 += 1 }) {
                                Text("🔥")
                                    .font(Font.custom("Sofia Pro", size: 8))
                                    .emojiReply()
                            }

                            Button(action: { smileCounter3 += 1 }) {
                                Text("🙂")
                                    .font(Font.custom("Sofia Pro", size: 8))
                                    .emojiReply()
                            }
                        }
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 4, trailing: 8))
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
