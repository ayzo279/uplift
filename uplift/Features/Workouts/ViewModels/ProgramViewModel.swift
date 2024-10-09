//
//  ProgramViewModel.swift
//  uplift
//
//  Created by Andy Zhuo on 10/3/24.
//

import SwiftUI
import FirebaseFirestore


class ProgramViewModel: ObservableObject {
    @Published var workoutProgram = WorkoutProgram(exercises: [], sets: [:])
    @Published var exercises: [String: [Exercise]] = [:]
    let categories: [String: String] = [
        "abdominals" : "ABS",
        "biceps" : "BICEPS",
        "calves" : "LEGS",
        "chest" : "CHEST",
        "glutes" : "GLUTES",
        "hamstrings" : "LEGS",
        "lats" : "BACK",
        "lower_back" : "BACK",
        "middle_back" : "BACK",
        "quadriceps" : "LEGS",
        "triceps" : "TRICEPS"
    ]
    
    init() {
//        loadExercises() // Load exercises from the JSON file when initializing
//        for category in self.categories.keys {
//            fetchExercises(muscleGroup: category)
//        }
        loadExercises()
    }
    
    static let apiKey: String = {
        guard let apiString = Bundle.main.infoDictionary?["API_KEY"]  as? String else {
            fatalError("API key not set")
        }
        return apiString
    }()
    
    func loadExercises() {
        let db = Firestore.firestore()

        db.collection("exercises").getDocuments { [weak self] (snapshot, error) in
            if let error = error {
                print("Error fetching exercises: \(error.localizedDescription)")
                return
            }

            guard let documents = snapshot?.documents else {
                print("No exercises found")
                return
            }

            for document in documents {
                let data = document.data()
                if let name = data["name"] as? String,
                   let type = data["type"] as? String,
                   let muscle = data["muscle"] as? String,
                   let equipment = data["equipment"] as? String,
                   let difficulty = data["difficulty"] as? String,
                   let instructions = data["instructions"] as? String {
                    
                    let exercise = Exercise(name: name, type: type, muscle: muscle, equipment: equipment, difficulty: difficulty, instructions: instructions)
                    if let categoryKey = self?.categories[muscle] {
                        self?.exercises[categoryKey, default: []].append(exercise)
                    }                }
            }

            print("Exercises loaded from Firestore")
        }
    }
    
    // Fetches exercises from workout API
    func fetchExercises(muscleGroup: String) {
        let muscle = muscleGroup.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle="+muscle!)!
        var request = URLRequest(url: url)
        request.setValue(ProgramViewModel.apiKey, forHTTPHeaderField: "X-Api-Key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }

                if let exercises = try? JSONDecoder().decode([Exercise].self, from: data) {
                    self.saveExercisesToFirestore(muscleGroup: muscleGroup, exercises: exercises)
                } else {
                    print("Failed to decode JSON")
                }
            }.resume()
    }
    
    func saveExercisesToFirestore(muscleGroup: String, exercises: [Exercise]) {
        let db = Firestore.firestore()
        
        // Convert exercises to a dictionary array for Firestore
        for exercise in exercises {
            let exerciseData: [String: Any] = [
                "name": exercise.name,
                "type": exercise.type,
                "muscle": exercise.muscle,
                "equipment": exercise.equipment,
                "difficulty": exercise.difficulty,
                "instructions": exercise.instructions
            ]
            
            let documentId = UUID().uuidString
            db.collection("exercises").document(documentId).setData(exerciseData) { error in
                if let error = error {
                    print("Error saving exercise \(exercise.name) to Firestore: \(error.localizedDescription)")
                } else {
                    print("Exercise \(exercise.name) successfully saved to Firestore")
                }
            }
        }
 
    }
}


