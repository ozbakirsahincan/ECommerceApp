//
//  HomeViewModel.swift
//  Ecommerce
//
//  Created by Şahincan Özbakır on 30.01.2022.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var searchQuery = ""
    
    
    //Search bar için Combine
    var searchCancellable: AnyCancellable? = nil
    
    //fetch data
    @Published var fechedProducts: [Product]? = nil
    init(){
        searchCancellable = $searchQuery
            .removeDuplicates()
            .debounce(for:0.6, scheduler: RunLoop.main)
            .sink(receiveValue: {str in
                if str == "" {
                    // reset data
                    self.fechedProducts = nil
                } else {
                    //search data
                    self.getProducts()
                }
            })
    }
    func getProducts(){
        let url = "https://fakestoreapi.com/products"
        //let session = URLSession(configuration: .default)
        URLSession.shared.dataTask(with: URL(string: url)!){ (data, _, err) in
            if let error = err{
                print(error.localizedDescription)
                return
            }
            guard let APIData = data else {
                print("No data found :/")
                return
            }
            
            do {
                // Decoding API data
                let products = try JSONDecoder().decode(APIResult.self, from: APIData)
                
                DispatchQueue.main.async {
                    if self.fechedProducts == nil {
                        self.fechedProducts = products.data.results
                    }
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
}
