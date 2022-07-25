//
//  CheckmateBoardConfigurator.swift
//  StudentProject
//
//  Created by Nikita Kuzmich on 17.07.22.
//

import UIKit
import Foundation

class CheckmateBoardConfigurator {
    func addLettersArray(array: [Symbols]) -> [Symbols] {
        return [Symbols(value: "A"), Symbols(value: "B"), Symbols(value: "C"), Symbols(value: "D"), Symbols(value: "E"), Symbols(value: "F"), Symbols(value: "G"), Symbols(value: "H")]
    }
    
    func addNumbersArray(array: [Symbols]) -> [Symbols] {
        return [Symbols(value: "1"), Symbols(value: "2"), Symbols(value: "3"), Symbols(value: "4"), Symbols(value: "5"), Symbols(value: "6"), Symbols(value: "7"), Symbols(value: "8")]
    }
    
    func addLabel(x: Double, y: Double, width: Double, height: Double, labelText: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: x , y: y, width: width, height: height))
        label.backgroundColor = .yellow
        label.text = labelText
        label.textAlignment = .center
        return label
    }
    
    func addSqaures(x: Double, y: Double, width: Double, height: Double, color: UIColor) -> UIView {
        let square = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        square.backgroundColor = color
        return square
    }
    func addChecker(x: Double, y: Double, width: Double, height: Double, color: UIColor) -> UIView {
        let checker = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        checker.backgroundColor = color
        checker.layer.cornerRadius = 7
        return checker
    }
    
    func checkmateBoard(letters: [Symbols], numbers: [Symbols]) -> UIView {
        let boardView = UIView(frame: CGRect(x: 10, y: 150, width: 300, height: 300))
        boardView.backgroundColor = .brown
        
        let letterLabelX = 0.0
        let letterLabelY = 0.0
        let sizeLabel = Double(200 / ((letters.count + numbers.count) / 2))
        let sizeSquare = sizeLabel
        
        for indexDown in 0...numbers.count - 1 {
            for indexRight in 0...letters.count - 1 {
                if (indexDown + indexRight) % 2 == 0 {
                    let blackSquare = addSqaures(x: sizeSquare * Double(indexRight) + 50, y:  sizeSquare * Double(indexDown) + 50, width: sizeSquare, height: sizeSquare, color: .black)
                    boardView.addSubview(blackSquare)
                    if indexDown < 3 {
                        blackSquare.addSubview(addChecker(x: sizeSquare / 4, y: sizeSquare / 4, width: sizeSquare / 2, height: sizeSquare / 2, color: .red))
                    }
                    if indexDown > numbers.count - 4 {
                        blackSquare.addSubview(addChecker(x: sizeSquare / 4, y: sizeSquare / 4, width: sizeSquare / 2, height: sizeSquare / 2, color: .blue))
                    }
                }
                else {
                    boardView.addSubview(addSqaures(x: sizeSquare * Double(indexRight) + 50, y: sizeSquare * Double(indexDown) + 50, width: sizeSquare, height: sizeSquare, color: .white))
                }
            }
        }
        
        for lettersIndex in 0...letters.count - 1 {
            if letters.count % 2 == 0 && numbers.count % 2 == 1 {
                boardView.addSubview(addLabel(x: sizeLabel * Double(lettersIndex) + 50, y: letterLabelY + 50 - sizeLabel / 2, width: sizeSquare, height: sizeSquare / 2, labelText: letters[lettersIndex].value))
                
                boardView.addSubview(addLabel(x: sizeLabel * Double(lettersIndex) + 50, y: 250 + sizeLabel, width: sizeSquare, height: sizeSquare / 2, labelText: letters[lettersIndex].value))
            } else {
                boardView.addSubview(addLabel(x: sizeLabel * Double(lettersIndex) + 50, y: letterLabelY + 50 - sizeLabel / 2, width: sizeSquare, height: sizeSquare / 2, labelText: letters[lettersIndex].value))
                
                boardView.addSubview(addLabel(x: sizeLabel * Double(lettersIndex) + 50, y: 250, width: sizeSquare, height: sizeSquare / 2, labelText: letters[lettersIndex].value))
            }
        }
        
        for numbersIndex in 0...numbers.count - 1 {
            if numbers.count % 2 == 0 && letters.count % 2 == 1 {
                boardView.addSubview(addLabel(x: letterLabelX + 50 - sizeLabel / 2, y: sizeLabel * Double(numbersIndex) + 50, width: sizeSquare / 2, height: sizeSquare, labelText: numbers[numbersIndex].value))
                
                boardView.addSubview(addLabel(x: 250 + sizeLabel, y: sizeLabel * Double(numbersIndex) + 50, width: sizeSquare / 2, height: sizeSquare, labelText: numbers[numbersIndex].value))
            } else {
                boardView.addSubview(addLabel(x: letterLabelX + 50 - sizeLabel / 2, y: sizeLabel * Double(numbersIndex) + 50, width: sizeSquare / 2, height: sizeSquare, labelText: numbers[numbersIndex].value))
                
                boardView.addSubview(addLabel(x: 250, y: sizeLabel * Double(numbersIndex) + 50, width: sizeSquare / 2, height: sizeSquare, labelText: numbers[numbersIndex].value))
            }
        }
        return boardView
    }
}


class Symbols {
    var value: String
    
    init(value: String) {
        self.value = value
    }
}
