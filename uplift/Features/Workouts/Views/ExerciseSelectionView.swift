//
//  ExerciseSelectionView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/3/24.
//

import SwiftUI

struct SelectExercisesView: View {
    @ObservedObject var viewModel = ProgramViewModel()
    @State private var selectedExercises: Set<Exercise> = []
    
    var body: some View {
        VStack{
            ForEach(viewModel.exercises.keys.sorted(), id:\.self) {category in
                Text(category)
            }
        }
    }
}


#Preview {
    SelectExercisesView()
}
