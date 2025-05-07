import SwiftUI


struct ContentView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                Image("applebg1")
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

                        } // end Convo
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        // Convo
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

                        } // end Convo
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        // Convo
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

                        } // end Convo
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        // Convo
                        VStack(alignment: .trailing) {

                            HStack {
                                Text("Man what a crazy weekend.")
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

                        } // end Convo
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        // Convo
                        VStack(alignment: .trailing) {

                            HStack {
                                Text("So what did you thnk of the new car.")
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

                                Image("dctc")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)


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


                                Text("really.")
                                    .foregroundColor(.gray)
                                //                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)

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

                                Text("Sheesh yeah right I know you.")
                                    .foregroundColor(.gray)

                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)

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


                                Image("dctc")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)


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
                                    .overlay(
                                        Circle()
                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
                                    )
                                Text("Well of course! you're welcome to visit anytime! We can't wait to see you!")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)

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

                                Text("And of course, bring your friends!It's a party afterall!")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)

                            }
                            .padding(.trailing, 40)
                        }
                        // Convo

                        // Convo
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

                        // Convo
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Image("avb")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)

                                Text("Sheesh yeah right I know you.")
                                    .foregroundColor(.gray)

                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)

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


                                Image("dctc")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)


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
                                    .overlay(
                                        Circle()
                                            .stroke(Color(red: 255, green: 255, blue: 255), lineWidth: 1)
                                    )
                                Text("Well of course! you're welcome to visit anytime! We can't wait to see you!")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)

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

                                Text("And of course, bring your friends!It's a party afterall!")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)

                            }
                            .padding(.trailing, 40)
                        }
                        // Convo

                    }
                    .padding(10)// end Vstack

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
            } // end Zstack
        } //end navstack

        }

    }//end scrollview


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
