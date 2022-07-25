//
//  Exercise.swift
//  StudentProject
//
//  Created by Nikita Kuzmich on 21.07.22.
//

import Foundation

class Exercise {
    var exerciseName: String
    var repeatExercise: Int
    var countOfExercise: Int
    var weight: Int
    init(exerciseName: String, repeatExercise: Int, countOfExercise: Int, weight: Int) {
        self.exerciseName = exerciseName
        self.repeatExercise = repeatExercise
        self.countOfExercise = countOfExercise
        self.weight = weight
    }
    func convertRepeatExerciseToString() -> String {
        return "\(repeatExercise)"
    }
    
    func convertCountOfExerciseToString() -> String {
        return "\(countOfExercise)"
    }
    
    func convertWeightToString() -> String {
        return "\(weight)"
    }
}
