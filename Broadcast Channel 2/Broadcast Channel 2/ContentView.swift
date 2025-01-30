import SwiftUI
import EffectsLibrary


struct ContentView: View {


    var body: some View {
//        ConfettiView()
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // BOX 1
                VStack(alignment: .leading, spacing: 0) {
                    Text("Box 1")
                        .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                        .background(Color.blue)
                        .overlay(
                            Image("missy")
                                .resizable()
                                .scaledToFit()
                        )
                }

                // BOX 2
                VStack(alignment: .leading, spacing: 0) {
                    Text("Box 2")
                        .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                        .background(Color.blue)
                        .overlay(
                            Image("lordbusiness")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        )
                }

                // BOX 3
                HStack {
                    VStack(spacing: 1) {
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
                        }//end Vstack
                        
                        
                        // BOX 4
                        
                        Spacer()
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Box 4")
                                .frame(maxWidth: 262, minHeight: 185, maxHeight: 185)
                                .background(Color.blue)
                            
                                .overlay(
                                    Image("venom")
                                        .resizable()
                                        .scaledToFit()
                                )
                            
                        } //end VStack
                    } //endVStack
                }
                //end HStack

            } //end VStack parent view
            .padding()
        } // end scrollview
    } // end body view
} //end content view

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
