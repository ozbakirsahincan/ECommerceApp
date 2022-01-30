//
//  ContentView.swift
//  Ecommerce
//
//  Created by Şahincan Özbakır on 30.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    var body: some View {
        NavigationView {
            ZStack{
                NavigationLink(destination: SignUp(show: self.$show) , isActive: self.$show) {
                    Text("111")
                }
                .hidden()
                LoginPage(show: $show)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ErrorView : View {
    @Binding var alert : Bool
    @Binding var error : String
    var body: some View{
        GeometryReader{ _ in
            VStack {
                HStack {
                    Text("Error")
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.7))
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal , 25)
                
                Text(self.error)
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                }
                .background(Color.accentColor)
                .cornerRadius(10)
                .padding(.top, 25)
                
            }
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}


