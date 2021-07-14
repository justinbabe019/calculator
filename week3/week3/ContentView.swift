//
//  ContentView.swift
//  梁雅姿.week3
//
//  Created by visitor on 14/07/2021.
//

import SwiftUI

struct ContentView: View {
    @State var firstName=""
    @State var lastName=""
    @State var region=""
    @State var email=""
    @State var phoneNumber=""
    @State var showingAlert = false
    @State var message = ""
    var countries = ["", "Macao S.A.R.", "Hong Kong S.A.R.", "Mainland China"]
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = "Red"
    func sendIt() {
        
    }
    
    var body: some View {
        
        NavigationView{
        //Text("Personal Information Fill In")
            
        
        
        Form{
            Section(header: Text("PERSONAL DETAILS")){
                VStack{
                    TextField("First Name", text: $firstName)
                        .padding(14.0)
                    TextField("Last Name", text: $lastName)
                        .padding(14.0)
                }
            }
            Section(header: Text("CONTACT")){
                TextField("Email", text: $email)
                    .padding(14.0)
                TextField("Phone Number", text: $phoneNumber)
                    .padding(14.0)
            }
            Section{
                Picker("Region", selection: $region){
                    ForEach(countries, id: \.self) {
                        Text($0)
                    }
                }
                Picker("Please choose a color", selection: $selectedColor) {
                                ForEach(colors, id: \.self) {
                                    Text($0)
                                }
                            }
            }
            Section{
                Button(action: {
                    showingAlert = true
                },label:{
                    Text("Send")
                }).alert(isPresented: $showingAlert){
                    Alert(title: Text("Success"), message: Text(message))
                }
            }
        }
        }.navigationTitle("Member Form")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
