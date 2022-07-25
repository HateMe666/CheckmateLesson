//
//  GymViewController.swift
//  StudentProject
//
//  Created by Nikita Kuzmich on 21.07.22.
//

import UIKit

class GymViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        let labelView = UILabel()
        labelView.text = "Friday"
        labelView.backgroundColor = .orange
        labelView.textAlignment = .center
        labelView.font = UIFont.boldSystemFont(ofSize: 15)
        labelView.font = labelView.font.withSize(40)
        view.addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelView.topAnchor.constraint(equalTo: view.topAnchor),
            labelView.widthAnchor.constraint(equalTo: view.widthAnchor),
            labelView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        for indexView in 0...configureExercise().count - 1 {
            let exerciseView = ExerciseView()
            exerciseView.infoView.exerciseNameView.text = configureExercise()[indexView].exerciseName
            exerciseView.infoView.repeatExerciseCountView.text = configureExercise()[indexView].convertRepeatExerciseToString()
            exerciseView.infoView.exerciseCountView.text = configureExercise()[indexView].convertCountOfExerciseToString()
            exerciseView.infoView.weightCountView.text = configureExercise()[indexView].convertWeightToString()
            exerciseView.backgroundColor = .white
            exerciseView.layer.cornerRadius = 20
            view.addSubview(exerciseView)
            exerciseView.translatesAutoresizingMaskIntoConstraints = false
            if indexView == 0 {
                NSLayoutConstraint.activate([
                    exerciseView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 20),
                ])
            } else {
                NSLayoutConstraint.activate([
                    exerciseView.topAnchor.constraint(equalTo: view.subviews[indexView].bottomAnchor, constant: 20)
                ])
            }
            NSLayoutConstraint.activate([
                exerciseView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                exerciseView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
                exerciseView.heightAnchor.constraint(equalToConstant: 70)
            ])
        }
        addStartButton()
    }
    
    func configureExercise() -> [Exercise] {
        let exercisesArray = [Exercise(exerciseName: "Отжимания", repeatExercise: 10, countOfExercise: 57, weight: 12), Exercise(exerciseName: "Подтягивания", repeatExercise: 10, countOfExercise: 12, weight: 34), Exercise(exerciseName: "Приседания", repeatExercise: 7, countOfExercise: 13, weight: 12), Exercise(exerciseName: "Жим лежа", repeatExercise: 43, countOfExercise: 17, weight: 76), Exercise(exerciseName: "Пресс", repeatExercise: 65, countOfExercise: 13, weight: 54)]
        return exercisesArray
    }
    
    func addStartButton() {
        let startButton = UIButton(type: .system)
        startButton.backgroundColor = .systemBlue
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        startButton.layer.cornerRadius = 20
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            startButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}

class ExerciseView: UIView {
    let imageView = UIView()
    let arrowView = UIView()
    let infoView = ExerciseIfoView()
    init() {
        super.init(frame: .zero)
        configureUI()
        setupConstraints()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupConstraints() {
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1 / 6),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7)
        ])
        arrowView.backgroundColor = .black
        arrowView.layer.cornerRadius = 15
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrowView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            arrowView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1 / 6),
            arrowView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7)
        ])
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            infoView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 2 / 4),
            infoView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        
    }
    func configureUI() {
        addSubview(imageView)
        addSubview(arrowView)
        addSubview(infoView)
    }
}

class ExerciseIfoView: UIView {
    var exerciseNameView = UILabel()
    var repeatExerciseView = UILabel()
    var repeatExerciseCountView = UILabel()
    var exerciseCountView = UILabel()
    var countOfExerciseView = UILabel()
    var weightView = UILabel()
    var weightCountView = UILabel()
    
    init() {
        super.init(frame: .zero)
        configureUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureTopWidthHeigh(label: UILabel, secondLabel: UILabel, multiplier: CGFloat) {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 5),
            label.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier),
            label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1 / 5)
        ])
    }
    
    func setupConstraints() {
        exerciseNameView.textAlignment = .center
        exerciseNameView.font = UIFont.boldSystemFont(ofSize: 15)
        exerciseNameView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseNameView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            exerciseNameView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            exerciseNameView.widthAnchor.constraint(equalTo: self.widthAnchor),
            exerciseNameView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1 / 3)
        ])
        repeatExerciseView.text = "Подходы"
        repeatExerciseView.textAlignment = .center
        repeatExerciseView.font = UIFont.boldSystemFont(ofSize: 10)
        repeatExerciseView.translatesAutoresizingMaskIntoConstraints = false
        configureTopWidthHeigh(label: repeatExerciseView, secondLabel: exerciseNameView, multiplier: 0.4)
        NSLayoutConstraint.activate([
            repeatExerciseView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        repeatExerciseCountView.translatesAutoresizingMaskIntoConstraints = false
        configureTopWidthHeigh(label: repeatExerciseCountView, secondLabel: repeatExerciseView, multiplier: 0.2)
        NSLayoutConstraint.activate([
            repeatExerciseCountView.centerXAnchor.constraint(equalTo: repeatExerciseView.centerXAnchor),
        ])
        countOfExerciseView.translatesAutoresizingMaskIntoConstraints = false
        countOfExerciseView.text = "ср. кол"
        countOfExerciseView.textAlignment = .center
        countOfExerciseView.font = UIFont.boldSystemFont(ofSize: 10)
        configureTopWidthHeigh(label: countOfExerciseView, secondLabel: exerciseNameView, multiplier: 0.4)
        NSLayoutConstraint.activate([
            countOfExerciseView.centerXAnchor.constraint(equalTo: exerciseNameView.centerXAnchor),
        ])
        exerciseCountView.translatesAutoresizingMaskIntoConstraints = false
        configureTopWidthHeigh(label: exerciseCountView, secondLabel: countOfExerciseView, multiplier: 0.2)
        NSLayoutConstraint.activate([
            exerciseCountView.centerXAnchor.constraint(equalTo: countOfExerciseView.centerXAnchor),
        ])
        weightView.translatesAutoresizingMaskIntoConstraints = false
        weightView.text = "ср. вес"
        weightView.textAlignment = .center
        weightView.font = UIFont.boldSystemFont(ofSize: 10)
        configureTopWidthHeigh(label: weightView, secondLabel: exerciseNameView, multiplier: 0.4)
        NSLayoutConstraint.activate([
            weightView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        weightCountView.translatesAutoresizingMaskIntoConstraints = false
        configureTopWidthHeigh(label: weightCountView, secondLabel: weightView, multiplier: 0.2)
        NSLayoutConstraint.activate([
            weightCountView.centerXAnchor.constraint(equalTo: weightView.centerXAnchor),
        ])
    }

    func configureUI() {
        addSubview(exerciseNameView)
        addSubview(repeatExerciseView)
        addSubview(repeatExerciseCountView)
        addSubview(countOfExerciseView)
        addSubview(exerciseCountView)
        addSubview(weightView)
        addSubview(weightCountView)
    }
    
}
