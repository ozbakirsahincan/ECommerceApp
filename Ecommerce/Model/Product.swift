//
//  Product.swift
//  Ecommerce
//
//  Created by Şahincan Özbakır on 30.01.2022.
//

import SwiftUI

struct APIResult: Codable {
    var data: APIProductData
}
struct APIProductData : Codable {
    var count: Int
    var results: [Product]
}
struct Product: Identifiable,Codable {
    var id = UUID()
    var title : String
    var price : Int
    var category :String 
    var image : String
    
    
}
