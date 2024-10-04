//
//  ProgramViewModel.swift
//  uplift
//
//  Created by Andy Zhuo on 10/3/24.
//

import SwiftUI

class ProgramViewModel: ObservableObject {
    @Published var workoutProgram = WorkoutProgram(exercises: [], sets: [:])
    @Published var exercises: [String:[Exercise]] = [:]
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
        for category in self.categories.keys {
            fetchExercises(muscleGroup: category)
        }
    }
    
    static let apiKey: String = {
        guard let apiString = Bundle.main.infoDictionary?["API_KEY"]  as? String else {
            fatalError("API key not set")
        }
        return apiString
    }()
    
    func fetchExercises(muscleGroup: String) {
        let muscle = muscleGroup.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle="+muscle!)!
        var request = URLRequest(url: url)
        request.setValue(ProgramViewModel.apiKey, forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
                    guard let data = data, error == nil else {
                        print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                        return
                    }
                    do {
                        let decodedResponse = try JSONDecoder().decode([Exercise].self, from: data)
                        DispatchQueue.main.async {
                            if let categoryKey = self?.categories[muscleGroup] {
                                self?.exercises[categoryKey] = decodedResponse
                            }
                        }
                    } catch {
                        print("Failed to decode JSON: \(error)")
                    }
                }
                task.resume()
    }
}


