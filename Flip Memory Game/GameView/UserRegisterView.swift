//
//  UserRegisterView.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 09/06/24.
//

import SwiftUI

//User register view
struct UserRegisterView: View {
    @Binding var name: String
    @State private var action: Int? = 0
    @State private var already = false
    @State private var empty = false
    @ObservedObject var userModel: UserVM
    @Binding var buttonCheck: Bool
    
    @Binding var show: Bool
    
    var body: some View {
        //Show when user access to game view
        if !show {
            ZStack {
                Color.black.opacity(!show ? 0.9 : 0).edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Green")
                    VStack{
                        Text("Register")
                            .fontWeight(.bold)
                            .modifier(TextModifier())
                        HStack {
                            Text("User name: ")
                            TextField(
                                "Enter user name",
                                text: $name
                            )
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        Spacer()
                        //Condition check about user register name
                        if(already) {
                            Text("User already exist, please register with a different name")
                                .foregroundColor(Color("Gray"))
                        } else if(empty) {
                            Text("Please enter a name")
                                .foregroundColor(Color("Gray"))
                        } else {}
                        Button {
                            //Check for exist username
                            if(userModel.getUsers().contains(name)) {
                                already = true
                                empty = false
                            } else if (name == "") { //Check for empty name
                                empty = true;
                                already = false
                            }
                            else {
                                buttonCheck = true
                                already = false
                                empty = false
                                show = true
                                userModel.addUser(name)
                            }
                        } label: {
                            Text("Play game")
                                .padding(5)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                }
                .frame(width: 300, height: 300)
                .cornerRadius(20)
            }
        }
    }
}
