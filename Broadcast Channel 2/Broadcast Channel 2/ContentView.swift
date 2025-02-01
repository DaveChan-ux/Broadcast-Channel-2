import SwiftUI
import EffectsLibrary

struct ContentView: View {
    @State private var config = ConfettiConfig(
        content: [
            .emoji("💩", 1),
            .emoji("💩", 1),
            .emoji("💩", 2)
                ],
//        backgroundColor: .blue,
        intensity: .medium,
        lifetime: .short,
//        initialVelocity: .medium,
        fadeOut: .fast,
        spreadRadius: .medium,
        emitterPosition: .bottom,
        fallDirection: .upwards
    )

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // BOX 1
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Box 1")
                            .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                            .background(Color.gray.opacity(0.10))
                            .cornerRadius(10)
                            .overlay(
                                Image("missy")
                                    .resizable()
                                    .scaledToFit()
                            )
                            .background(
                                RoundedRectangle(cornerRadius:10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }

                    // BOX 2
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Box 2")
                            .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                            .background(Color.white)
                            .overlay(
                                Image("lordbusiness")
                                    .resizable()
                                    .scaledToFit()
                            )
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }

                    // BOX 3
                    HStack(spacing: 1) {
                        Spacer()
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Box 3")
                                .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                                .background(Color.blue)
                                .overlay(
                                    Image("venom")
                                        .resizable()
                                        .scaledToFit()
                                )
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        }
                    }

                    // BOX 4
                    HStack(spacing: 1) {
                        Spacer()
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Box 4")
                                .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                                .background(Color.white)
                                .border(Color.gray, width: 1)
                                .overlay(
                                    Image("venom")
                                        .resizable()
                                        .scaledToFit()
                                )
                        }
                    }
                }
                .padding()
            }
            .padding()

            ConfettiView(config: config)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
