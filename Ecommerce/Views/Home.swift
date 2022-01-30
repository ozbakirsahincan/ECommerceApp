//
//  Home.swift
//  Ecommerce
//
//  Created by Şahincan Özbakır on 30.01.2022.
//

import SwiftUI

struct Home : View {
    @StateObject var homeData = HomeViewModel()
    var body: some View {
        TabView {
            //Home Page
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
                .environmentObject(homeData)
            Text("Categories")
                .tabItem{
                    Image(systemName: "list.bullet.indent")
                    Text("Categories")
                }
            
            Text("Orders")
                .tabItem{
                    Image(systemName: "tag.fill")
                    Text("Orders")
                }
            Text("Person")
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Person")
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
