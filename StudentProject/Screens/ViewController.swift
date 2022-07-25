//
//  ViewController.swift
//  StudentProject
//
//  Created by Nikita Kuzmich on 8.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let shopView = configureUIForShop(shop: configureShop())
        view.addSubview(shopView)
        shopView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shopView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shopView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shopView.heightAnchor.constraint(equalToConstant: 250 ),
            shopView.widthAnchor.constraint(equalToConstant: view.bounds.width)
        ])
        
        let buyerView = configureUIForBuyer(buyer: configureBuyer())
        view.addSubview(buyerView)
        buyerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buyerView.topAnchor.constraint(equalTo: shopView.bottomAnchor, constant: 20),
            buyerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buyerView.heightAnchor.constraint(equalTo: shopView.heightAnchor, multiplier: 1 / 2),
            buyerView.widthAnchor.constraint(equalTo: shopView.widthAnchor)
        ])
    }
    
    func Snickers() -> Item {
        return Item(name: "Snickers", price: 5)
    }
    
    func Twix() -> Item {
        return Item(name: "Twix", price: 4)
    }
    
    func KitKat() -> Item {
        return Item(name: "KitKat", price: 3)
    }
    
    func configureBuyer() -> [Buyer] {
        let buyersArray = [Buyer(countOfMoney: 10, itemChoice: ["Snickers", "Twix"], name: "Igor"), Buyer(countOfMoney: 5, itemChoice: ["Twix"], name: "Zahar"), Buyer(countOfMoney: 12, itemChoice: ["Snickers", "Twix", "KitKat"], name: "Andrei")]
        return buyersArray
    }
    
    func configureShop() -> Shop {
        let itemsArray = [Snickers(), Snickers(), Snickers(), Twix(), Twix(), KitKat(), KitKat(), KitKat(), KitKat()]
        let vendersArray = [Vender(name: "Oleg"), Vender(name: "Vasya"), Vender(name: "Stepan")]
        return Shop(items: itemsArray, budget: 30, venders: vendersArray, name: "EVROOPT")
    }
    func configureView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func configureLabelForView(textLabel: String, color: UIColor) -> UILabel {
        let label = UILabel()
        label.backgroundColor = color
        label.text = textLabel
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func configureConstraintsForView(UIView: UIView, anotherUIView: UIView) {
        NSLayoutConstraint.activate([
            UIView.topAnchor.constraint(equalTo: anotherUIView.topAnchor),
            UIView.heightAnchor.constraint(equalTo: anotherUIView.heightAnchor, multiplier: 0.5),
            UIView.widthAnchor.constraint(equalTo: anotherUIView.widthAnchor, multiplier: 1 / 3)
        ])
    }
    
    func configureConstraintsForBuyersView(UIView: UIView, anotherUIView: UIView) {
        UIView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            UIView.topAnchor.constraint(equalTo: anotherUIView.topAnchor),
            UIView.heightAnchor.constraint(equalTo: anotherUIView.heightAnchor),
            UIView.widthAnchor.constraint(equalTo: anotherUIView.widthAnchor, multiplier: 1 / 3)
        ])
    }
    
    func configureConstraintsForLabel(UILabel: UILabel, UIView: UIView) {
        NSLayoutConstraint.activate([
            UILabel.heightAnchor.constraint(equalTo: UIView.heightAnchor, multiplier: 0.5),
            UILabel.widthAnchor.constraint(equalTo: UIView.widthAnchor)
        ])
    }
    
    func configureHeighWidthForLabels(UILabel: UILabel, UIView: UIView) {
        NSLayoutConstraint.activate([
            UILabel.heightAnchor.constraint(equalTo: UIView.heightAnchor, multiplier: CGFloat(1) / CGFloat(configureBuyer().count)),
            UILabel.widthAnchor.constraint(equalTo: UIView.widthAnchor)
        ])
    }
    
    func configureUIForShop(shop: Shop) -> UIView {
        let shopView = UIView()
        shopView.backgroundColor = .black
        for venderIndex in 0...shop.venders.count - 1 {
            let venderLabel = UILabel()
            venderLabel.text = shop.venders[venderIndex].name
            venderLabel.textAlignment = .center
            venderLabel.backgroundColor = .green
            shopView.addSubview(venderLabel)
            venderLabel.translatesAutoresizingMaskIntoConstraints = false
            
            if shopView.subviews.count == 1 {
                NSLayoutConstraint.activate([
                    venderLabel.leadingAnchor.constraint(equalTo: shopView.leadingAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    venderLabel.leadingAnchor.constraint(equalTo: shopView.subviews[venderIndex - 1].trailingAnchor),
                ])
            }
            NSLayoutConstraint.activate([
                venderLabel.bottomAnchor.constraint(equalTo: shopView.bottomAnchor, constant: 0),
                venderLabel.heightAnchor.constraint(equalTo: shopView.heightAnchor, multiplier: 0.5),
                venderLabel.widthAnchor.constraint(equalTo: shopView.widthAnchor, multiplier: CGFloat(1) / CGFloat(shop.venders.count))
            ])
        }
        
        let budgetView = configureView(color: .yellow)
        shopView.addSubview(budgetView)
        
        let budgetValue = configureLabelForView(textLabel: "Budget shop", color: .white)
        budgetView.addSubview(budgetValue)
        configureConstraintsForLabel(UILabel: budgetValue, UIView: budgetView)
        
        NSLayoutConstraint.activate([
            budgetValue.topAnchor.constraint(equalTo: budgetView.topAnchor),
            budgetValue.leadingAnchor.constraint(equalTo: budgetView.leadingAnchor),
        ])
        
        let budgetLabel = configureLabelForView(textLabel: shop.convertBudgetToString(), color: .yellow)
        budgetView.addSubview(budgetLabel)
        configureConstraintsForLabel(UILabel: budgetLabel, UIView: budgetView)
        NSLayoutConstraint.activate([
            budgetLabel.topAnchor.constraint(equalTo: budgetValue.bottomAnchor),
            budgetLabel.leadingAnchor.constraint(equalTo: budgetView.leadingAnchor),
        ])
        
        configureConstraintsForView(UIView: budgetView, anotherUIView: shopView)
        NSLayoutConstraint.activate([
            budgetView.leadingAnchor.constraint(equalTo: shopView.leadingAnchor)
        ])
        
        let nameView = configureView(color: .red)
        shopView.addSubview(nameView)
        
        let valueLabel = configureLabelForView(textLabel: "Name", color: .orange )
        nameView.addSubview(valueLabel)
        configureConstraintsForLabel(UILabel: valueLabel, UIView: nameView)
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: nameView.topAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: budgetView.trailingAnchor)
        ])
        
        let shopNameLabel = configureLabelForView(textLabel: shop.name, color: .blue)
        shopView.addSubview(shopNameLabel)
        configureConstraintsForLabel(UILabel: shopNameLabel, UIView: nameView)
        NSLayoutConstraint.activate([
            shopNameLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor),
            shopNameLabel.leadingAnchor.constraint(equalTo: budgetView.trailingAnchor),
        ])
        
        configureConstraintsForView(UIView: nameView, anotherUIView: shopView)
        NSLayoutConstraint.activate([
            nameView.leadingAnchor.constraint(equalTo: budgetView.trailingAnchor)
        ])
        
        let cellsItemView = configureView(color: .white)
        shopView.addSubview(cellsItemView)
        NSLayoutConstraint.activate([
            cellsItemView.leadingAnchor.constraint(equalTo: nameView.trailingAnchor),
            cellsItemView.topAnchor.constraint(equalTo: shopView.topAnchor),
            cellsItemView.heightAnchor.constraint(equalTo: shopView.heightAnchor, multiplier: 0.5),
            cellsItemView.widthAnchor.constraint(equalTo: budgetView.widthAnchor, multiplier: 0.5)
        ])
        
        let cellsPriceView = configureView(color: .lightGray)
        shopView.addSubview(cellsPriceView)
        NSLayoutConstraint.activate([
            cellsPriceView.leadingAnchor.constraint(equalTo: cellsItemView.trailingAnchor),
            cellsPriceView.topAnchor.constraint(equalTo: shopView.topAnchor),
            cellsPriceView.heightAnchor.constraint(equalTo: shopView.heightAnchor, multiplier: 0.5),
            cellsPriceView.widthAnchor.constraint(equalTo: budgetView.widthAnchor, multiplier: 0.5)
        ])
        
        for itemIndex in 0...shop.items.count - 1 {
            let labelItem = configureLabelForView(textLabel: shop.items[itemIndex].name, color: .brown)
            labelItem.font = labelItem.font.withSize(10)
            cellsItemView.addSubview(labelItem)
            
            let labelPrice = configureLabelForView(textLabel: shop.items[itemIndex].convertPriceToString(), color: .white)
            labelPrice.font = labelPrice.font.withSize(10)
            cellsPriceView.addSubview(labelPrice)
            
            if cellsItemView.subviews.count == 1 && cellsPriceView.subviews.count == 1 {
                NSLayoutConstraint.activate([
                    labelItem.topAnchor.constraint(equalTo: cellsItemView.topAnchor),
                    labelPrice.topAnchor.constraint(equalTo: cellsPriceView.topAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    labelItem.topAnchor.constraint(equalTo: cellsItemView.subviews[itemIndex - 1].bottomAnchor),
                    labelPrice.topAnchor.constraint(equalTo: cellsPriceView.subviews[itemIndex - 1].bottomAnchor)
                ])
            }
            
            NSLayoutConstraint.activate([
                labelItem.leadingAnchor.constraint(equalTo: nameView.trailingAnchor),
                labelItem.heightAnchor.constraint(equalTo: cellsItemView.heightAnchor, multiplier: CGFloat(1) / CGFloat(shop.items.count)),
                labelItem.widthAnchor.constraint(equalTo: cellsItemView.widthAnchor),
                
                labelPrice.leadingAnchor.constraint(equalTo: labelItem.trailingAnchor),
                labelPrice.heightAnchor.constraint(equalTo: cellsPriceView.heightAnchor, multiplier: CGFloat(1) / CGFloat(shop.items.count)),
                labelPrice.widthAnchor.constraint(equalTo: cellsPriceView.widthAnchor)
            ])
        }
        return shopView
    }
    
    func configureUIForBuyer(buyer: [Buyer]) -> UIView {
        let buyerView = configureView(color: .white)
        
        let leftView = configureView(color: .orange)
        buyerView.addSubview(leftView)
        configureConstraintsForBuyersView(UIView: leftView, anotherUIView: buyerView)
        NSLayoutConstraint.activate([
            leftView.leadingAnchor.constraint(equalTo: buyerView.leadingAnchor)
        ])
        
        let secondaryView = configureView(color: .white)
        buyerView.addSubview(secondaryView)
        configureConstraintsForBuyersView(UIView: secondaryView, anotherUIView: buyerView)
        NSLayoutConstraint.activate([
            secondaryView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor)
        ])
        
        let rightView = configureView(color: .lightGray)
        buyerView.addSubview(rightView)
        configureConstraintsForBuyersView(UIView: rightView, anotherUIView: buyerView)
        NSLayoutConstraint.activate([
            rightView.leadingAnchor.constraint(equalTo: secondaryView.trailingAnchor)
        ])
        
        for indexBuyer in 0...buyer.count - 1 {
            var choiceString = ""
            for item in buyer[indexBuyer].itemChoice {
                choiceString += "\(item) "
            }
            let leftLabel = configureLabelForView(textLabel: buyer[indexBuyer].name, color: .yellow)
            leftView.addSubview(leftLabel)
            let rightLabel = configureLabelForView(textLabel: buyer[indexBuyer].convertCountOfMoneyToString(), color: .yellow)
            rightView.addSubview(rightLabel)
            let secondaryLabel = configureLabelForView(textLabel: choiceString, color: .white)
            secondaryView.addSubview(secondaryLabel)
            
            if leftView.subviews.count == 1 && secondaryView.subviews.count == 1 && rightView.subviews.count == 1 {
                NSLayoutConstraint.activate([
                    leftLabel.topAnchor.constraint(equalTo: leftView.topAnchor),
                    secondaryLabel.topAnchor.constraint(equalTo: secondaryView.topAnchor),
                    rightLabel.topAnchor.constraint(equalTo: rightView.topAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    leftLabel.topAnchor.constraint(equalTo: leftView.subviews[indexBuyer - 1].bottomAnchor),
                    secondaryLabel.topAnchor.constraint(equalTo: secondaryView.subviews[indexBuyer - 1].bottomAnchor),
                    rightLabel.topAnchor.constraint(equalTo: rightView.subviews[indexBuyer - 1].bottomAnchor)
                ])
            }
            configureHeighWidthForLabels(UILabel: leftLabel, UIView: leftView)
            configureHeighWidthForLabels(UILabel: secondaryLabel, UIView: secondaryView)
            configureHeighWidthForLabels(UILabel: rightLabel, UIView: rightView)
        }
        return buyerView
    }
}



