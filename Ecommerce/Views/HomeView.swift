//
//  HomeView.swift
//  Ecommerce
//
//  Created by Şahincan Özbakır on 30.01.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homeData: HomeViewModel
    var body: some View {
        NavigationView {
            // Üstte çok boşluk olursa Navigation kaldıracagm
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15) {
                    
                    //Search Bar
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Kategori veya ürün ara",text: $homeData.searchQuery)
                    }
                    .padding(.vertical , 10)
                    .padding(.horizontal)
                    .background(Color.white)
                    // Shadow
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
                }
                .padding()
                
                if let products = homeData.fechedProducts {
                    
                    if products.isEmpty {
                        // No results
                        Text("No results found ...")
                            .padding(.top,20)
                    } else {
                        // Displaying Results
                        ForEach(products) {data in
                            Text(data.category)
                            
                        }
                    }
                    
                } else {
                    // Loading Screen
                    if homeData.searchQuery != "" {
                        ProgressView()
                            .padding(.top,20)
                    }
                        
                }
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
