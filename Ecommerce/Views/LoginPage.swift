//
//  LoginPage.swift
//  Ecommerce
//
//  Created by Şahincan Özbakır on 30.01.2022.
//

import SwiftUI

struct LoginPage : View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUserName = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                ZStack(alignment: .bottom) {
                    
                    GeometryReader{_ in
                        VStack {
                            Spacer().frame(height : 131)
                            Image("logo")
                            Text("Hesabına Giriş Yap")
                                .font(.title2)
                                .bold()
                                .padding(.top)
                            TextField("demo@hizligeliyo.com",text:$username)
                                .padding()
                                .frame(width: 318, height: 60)
                            //.background(Color.black.opacity(0.05))
                                .background(Color.white)
                                .cornerRadius(25)
                                .border(.red,width: CGFloat(wrongUserName))
                                .padding()
                                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                            // Password Case
                            HStack {
                                VStack {
                                    if self.visible {
                                        TextField("*******",text:$password)
                                    } else {
                                        SecureField("*******",text:$password)
                                    }
                                }
                                
                                
                                Button(action: {
                                    self.visible.toggle()
                                }) {
                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                }
                            }
                            .padding()
                            .frame(width: 318, height: 60)
                            .background(Color.white)
                            .cornerRadius(25)
                            .border(.red,width: CGFloat(wrongPassword))
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                            // End Case
                            
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                    
                                }){
                                    Text("Şifremi Unuttum ")
                                        .foregroundColor(Color.black)
                                        .frame(width: UIScreen.main.bounds.width - 150)
                                }
                                .padding(.horizontal , -10 )
                            }
                            .padding(.top,20)
                            
                            
                            //Forgot Password Case
                            Button("Giriş Yap") {
                                self.verify()
                                authenticateUser(username: username, password: password)
                            }
                            .foregroundColor(.white)
                            .frame(width: 251, height: 56)
                            .background(Color.accentColor)
                            .cornerRadius(25)
                            HStack {
                                Text("Hesabın yok mu ?")
                                    .foregroundColor(Color.black)
                                Button(action: {
                                    self.show.toggle()
                                }) {
                                    Text("Kaydol")
                                        .foregroundColor(Color.accentColor)
                                    
                                }
                            }
                            
                            NavigationLink(destination: Home()  , isActive: $showingLoginScreen) {
                                //EmptyView()
                            }
                            
                        }
                        
                        
                    }
                    if self.alert {
                        ErrorView(alert: self.$alert, error: self.$error)
                }
                
                }
            }
            //.navigationBarHidden(true)
        }
        
    }
    func verify(){
        if self.username != "" && self.password != ""{
            
        }
        else {
            self.error = "Lütfen tüm alanların dolu olduğundan emin olun !"
            self.alert.toggle()
        }
    }
    
    func authenticateUser(username: String , password: String) {
        if username.lowercased() == "admin" {
            wrongUserName = 0
            
            if password.lowercased() == "password" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUserName = 2
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage(show: ContentView().$show)
    }
}

