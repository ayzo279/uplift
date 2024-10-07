//
//  Program.swift
//  uplift
//
//  Created by Andy Zhuo on 10/3/24.
//

import Foundation

struct Exercise: Codable,Hashable {
    let name: String
    let type: String
    let muscle: String
    let equipment: String
    let difficulty: String
    let instructions: String
}

struct WorkoutProgram {
    var exercises: [Exercise]
    var sets: [Exercise: Int]
}
