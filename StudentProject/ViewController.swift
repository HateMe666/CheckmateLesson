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
        view.backgroundColor = .green
        //        addStudents()
        //        namesArrayLabel()
        //        viewWithSmallViews()
        
        view.addSubview(checkmateBoard(letters: addLettersArray(array: [Symbols]()), numbers: addNumbersArray(array: [Symbols]())))
    }
    
    func addLettersArray(array: [Symbols]) -> [Symbols] {
        return [Symbols(value: "A"), Symbols(value: "B"), Symbols(value: "C"), Symbols(value: "D"), Symbols(value: "E"), Symbols(value: "F"), Symbols(value: "G"), Symbols(value: "H"), Symbols(value: "M")]
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
    
    func addStudents() {
        let label = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        view.addSubview(label)
        let studentArray = [Student(name: "Nikita"), Student(name: "Ilya"), Student(name: "Zahar"), Student(name: "Igor")]
        var textString = String()
        for student in 0...studentArray.count - 1 {
            if student != studentArray.count - 1  {
                textString += studentArray[student].name
                textString += ", "
            } else {
                textString += studentArray[student].name
                textString += ". "
            }
        }
        label.text = textString
    }
    
    func namesArrayLabel() {
        let studentArray = [Student(name: "Igor"), Student(name: "Vasya"), Student(name: "Oleg")]
        var textString = String()
        for index in 0...studentArray.count - 1 {
            let label = UILabel(frame: CGRect(x: 100 * index, y: 80, width: 90, height: 40))
            label.backgroundColor = .white
            view.addSubview(label)
            textString = studentArray[index].name
            label.text = textString
        }
    }
    
    func viewWithSmallViews() {
        let bigView = UIView(frame: CGRect(x: 35, y: 150 , width: 250, height: 250))
        bigView.backgroundColor = .white
        view.addSubview(bigView)
        var x = 0
        var y = 0
        for _ in 1...2 {
            for _ in 1...2 {
                let smallView = UIView(frame: CGRect(x: x, y: y, width: 125, height: 125))
                smallView.backgroundColor = .gray
                bigView.addSubview(smallView)
                x = 125
            }
            x = 0
            y = 125
        }
    }
    
}

class Symbols {
    var value: String
    
    init(value: String) {
        self.value = value
    }
}



class Student {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}




// Массив учеников, на каждого ученика свой лейбл со своим именем
// 1 вьюха и чтоб на нее поместились более мелкие вьюхи циклом без пробелов
