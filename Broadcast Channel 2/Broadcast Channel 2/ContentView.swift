import SwiftUI
import EffectsLibrary


struct ContentView: View {


    var body: some View {

//        var config = ConfettiConfig(
//            intensity: .low
//        )


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
                                RoundedRectangle(cornerRadius:10) // Using background instead of overlay
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
//                                    .cornerRadius(10)
                            )
                    }

                    // BOX 3 
                    HStack(spacing: 1) { //aligns box to the right
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
                                .overlay( // Add this overlay
                                            Rectangle()
                                                .stroke(Color.black, lineWidth: 2)
                                        )
                        }//end Vstack
                    }//end HStack
                    
                    // BOX 4
                    HStack(spacing: 1) { //aligns box to the right
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

                        } //end VStack
                    }
                    //end HStack
                    
                } //end VStack parent view
                .padding()
            }.padding() //end ScrollView

//            ConfettiView(config: config)
            ConfettiView()

        }// end Zstack
        .edgesIgnoringSafeArea(.all)
    } // end body view
} //end content view



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
