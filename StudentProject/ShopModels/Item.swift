//
//  Item.swift
//  StudentProject
//
//  Created by Nikita Kuzmich on 17.07.22.
//

import Foundation

class Item {
    var name: String
    let price: Int
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    func convertPriceToString() -> String {
        return "\(price)"
    }
}
