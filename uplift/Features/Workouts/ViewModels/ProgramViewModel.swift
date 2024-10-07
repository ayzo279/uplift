//
//  ProgramViewModel.swift
//  uplift
//
//  Created by Andy Zhuo on 10/3/24.
//

import SwiftUI

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
        loadExercises() // Load exercises from the JSON file when initializing
//        for category in self.categories.keys {
//            fetchExercises(muscleGroup: category)
//        }
    }
    
    static let apiKey: String = {
        guard let apiString = Bundle.main.infoDictionary?["API_KEY"]  as? String else {
            fatalError("API key not set")
        }
        return apiString
    }()
    
    func loadExercises() {
        // Get the URL for the workouts.json file in the app bundle
        guard let fileURL = Bundle.main.url(forResource: "workouts", withExtension: "json") else {
            print("workouts.json file not found in the app bundle.")
            return
        }

        do {
            let data = try Data(contentsOf: fileURL)
            let decodedData = try JSONDecoder().decode([String: [String: [Exercise]]].self, from: data)
            for (_, muscleGroup) in decodedData {
                for (category, exercises) in muscleGroup {
                    self.exercises[category, default: []].append(contentsOf: exercises)
                }
            }
            print("Exercises loaded from \(fileURL.path)")
        } catch {
            print("Failed to load exercises from file: \(error)")
        }
    }
    
//    func fetchExercises(muscleGroup: String) {
//        let muscle = muscleGroup.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle="+muscle!)!
//        var request = URLRequest(url: url)
//        request.setValue(ProgramViewModel.apiKey, forHTTPHeaderField: "X-Api-Key")
//        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//                    guard let data = data, error == nil else {
//                        print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
//                        return
//                    }
//                    do {
//                        let decodedResponse = try JSONDecoder().decode([Exercise].self, from: data)
//                        DispatchQueue.main.async {
//                            if let categoryKey = self?.categories[muscleGroup] {
//                                self?.exercises[muscleGroup, default: [:]][categoryKey] = decodedResponse
//                                self?.saveExercises() // Save to file after fetching
//                            }
//                        }
//                    } catch {
//                        print("Failed to decode JSON: \(error)")
//                    }
//                }
//                task.resume()
//    }
    
    // Function to save exercises to a JSON file
//    func saveExercises() {
//        let fileURL = getDocumentsDirectory().appendingPathComponent("workouts.json")
//
//        do {
//            let data = try JSONEncoder().encode(exercises)
//            try data.write(to: fileURL)
//            print("Exercises saved to \(fileURL.path)")
//        } catch {
//            print("Failed to save exercises to file: \(error)")
//        }
//    }
//    
//    private func getProjectDirectory() -> URL {
//        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
//        return currentDirectoryURL
//    }
}


