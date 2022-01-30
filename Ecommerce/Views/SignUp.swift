//
//  SignUp.swift
//  Ecommerce
//
//  Created by Şahincan Özbakır on 30.01.2022.
//

import SwiftUI

struct SignUp: View {
    @State private var username = ""
    @State private var password = ""
    @State private var repassword = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    
    var body: some View {
        ZStack (alignment: .topLeading){
            VStack(alignment: .center){
                VStack(spacing: 5){
                    Image("logo")
                    Text("Hesabına Giriş Yap")
                        .font(.title2)
                        .bold()
                        .padding(.top)
                    TextField("demo@hizligeliyo.com",text:$username)
                        .padding()
                        .frame(width: 318, height: 60,alignment: .center)
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                    Spacer().frame(height: 10)
                    
                    HStack(alignment: .center) {
                        VStack {
                            if self.visible {
                                TextField("*******",text:$password)
                                    .frame(alignment:.center)
                            } else {
                                SecureField("*******",text:$password)
                                    .frame(alignment:.center)
                            }
                        }
                        
                        
                        Button(action: {
                            self.visible.toggle()
                        }) {
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                        }
                    }
                    .padding()
                    .frame(width: 318, height: 60,alignment: .center)
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                    Spacer().frame(height: 10)
                    
                    HStack {
                        VStack {
                            if self.revisible {
                                TextField("*******",text:$repassword)
                                    .frame(alignment:.center)
                            } else {
                                SecureField("*******",text:$repassword)
                                    .frame(alignment:.center)
                            }
                        }
                        
                        
                        Button(action: {
                            self.revisible.toggle()
                        }) {
                            Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                        }
                    }
                    .padding()
                    .frame(width: 318, height: 60)
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                    Spacer().frame(height: 50)
                    Button("Kayıt ol") {
                        self.show.toggle()
                    }
                    .foregroundColor(.white)
                    .frame(width: 251, height: 56)
                    .background(Color.accentColor)
                    .cornerRadius(25)
                    
                    
                }
                Spacer().frame(height: 50)
            }
            
            Button(action: {
                self.show.toggle()
            }){
                Image(systemName: "chevron.left")
            }
            .padding()
        }
        
        .navigationBarBackButtonHidden(true)
        
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(show: ContentView().$show)
    }
}
