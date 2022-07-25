//
//  Byuers.swift
//  StudentProject
//
//  Created by Nikita Kuzmich on 19.07.22.
//

import Foundation

class Buyer {
    let countOfMoney: Int
    var itemChoice: [String]
    let name: String
    
    init(countOfMoney: Int, itemChoice: [String], name: String) {
        self.countOfMoney = countOfMoney
        self.itemChoice = itemChoice
        self.name = name
    }
    
    func convertCountOfMoneyToString() -> String {
        return "\(countOfMoney)"
    }
}
