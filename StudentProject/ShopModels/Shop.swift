//
//  Shop.swift
//  StudentProject
//
//  Created by Nikita Kuzmich on 17.07.22.
//

import Foundation

class Shop {
    var items: [Item]
    var budget: Int
    let venders: [Vender]
    let name: String
    init(items: [Item], budget: Int, venders: [Vender], name: String) {
        self.items = items
        self.budget = budget
        self.venders = venders
        self.name = name
    }
    func convertBudgetToString() -> String {
        return "\(budget)"
    }
}
