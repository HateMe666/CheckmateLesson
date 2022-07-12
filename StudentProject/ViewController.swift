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
        checkmateBoard()
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
    
    func checkmateBoard() {
        let boardView = UIView(frame: CGRect(x: 0, y: 100, width: 350, height: 350))
        boardView.backgroundColor = .brown
        view.addSubview(boardView)
        
        let letterLabelX = 10.0
        let letterLabelY = 10.0
        let sizeSquare = 31.25
        let sizeLabel = 31.25
        
        for indexDown in 1...8 {
            for indexRight in 1...8 {
                if (indexDown + indexRight) % 2 == 0 {
                    let blackSquare = UIView(frame: CGRect(x: sizeSquare * Double(indexRight), y: sizeSquare * Double(indexDown), width: sizeSquare, height: sizeSquare))
                    blackSquare.backgroundColor = .black
                    boardView.addSubview(blackSquare)
                } else {
                    let whiteSquare = UIView(frame: CGRect(x: sizeSquare * Double(indexRight), y: sizeSquare * Double(indexDown), width: sizeSquare, height: sizeSquare))
                    whiteSquare.backgroundColor = .white
                    boardView.addSubview(whiteSquare)
                }
            }
            let lettersLabel = UILabel(frame: CGRect(x: sizeLabel * Double(indexDown) , y: letterLabelY, width: sizeLabel, height: sizeLabel / 2))
            lettersLabel.backgroundColor = .yellow
            boardView.addSubview(lettersLabel)
            
            let lettersArray = [Letters(letter: "A"), Letters(letter: "B"), Letters(letter: "C"), Letters(letter: "D"), Letters(letter: "E"), Letters(letter: "F"), Letters(letter: "G"), Letters(letter: "H")]
            var textLetter = String()
            textLetter = lettersArray[indexDown - 1].letter
            lettersLabel.text = textLetter
            lettersLabel.textAlignment = .center
            
            let numbersLabel = UILabel(frame: CGRect(x: letterLabelX  , y: sizeLabel * Double(indexDown), width: sizeLabel / 2, height: sizeLabel))
            numbersLabel.backgroundColor = .yellow
            boardView.addSubview(numbersLabel)
            
            let numbersArray = [Numbers(number: "1"),Numbers(number: "2"),Numbers(number: "3"),Numbers(number: "4"),Numbers(number: "5"),Numbers(number: "6"),Numbers(number: "7"),Numbers(number: "8")]
            var textNumber = String()
            textNumber = numbersArray[indexDown - 1].number
            numbersLabel.text = textNumber
            numbersLabel.textAlignment = .center
            
            let lettersLabelRight = UILabel(frame: CGRect(x: sizeLabel * Double(indexDown) , y: 285 , width: sizeLabel, height: sizeLabel / 2))
            lettersLabelRight.backgroundColor = .yellow
            boardView.addSubview(lettersLabelRight)
            
            let lettersArrayRight = [Letters(letter: "A"), Letters(letter: "B"), Letters(letter: "C"), Letters(letter: "D"), Letters(letter: "E"), Letters(letter: "F"), Letters(letter: "G"), Letters(letter: "H")]
            var textLetterRight = String()
            textLetterRight = lettersArrayRight[indexDown - 1].letter
            lettersLabelRight.text = textLetterRight
            lettersLabelRight.textAlignment = .center
            
            let numbersLabelDown = UILabel(frame: CGRect(x: 285  , y: sizeLabel * Double(indexDown), width: sizeLabel / 2, height: sizeLabel))
            numbersLabelDown.backgroundColor = .yellow
            boardView.addSubview(numbersLabelDown)
            
            let numbersArrayDown = [Numbers(number: "1"),Numbers(number: "2"),Numbers(number: "3"),Numbers(number: "4"),Numbers(number: "5"),Numbers(number: "6"),Numbers(number: "7"),Numbers(number: "8")]
            var textNumberDown = String()
            textNumberDown = numbersArrayDown[indexDown - 1].number
            numbersLabelDown.text = textNumberDown
            numbersLabelDown.textAlignment = .center
        }
    }
}

class Letters {
    var letter: String
    
    init(letter: String) {
        self.letter = letter
    }
}

class Numbers {
    var number: String
    
    init(number: String) {
        self.number = number
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
