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
    @State private var selectedMuscleGroups: Set<String> = []
    @State private var showMuscleFilter = false

    
    var body: some View {
        NavigationStack{
            
            VStack(spacing: 40){
                HStack{
                    NavigationLink(destination: EmptyView()) {
                        HStack{
                            Image(systemName: "chevron.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                            Text("Back to program")
                        }
                        .foregroundColor(Color("Charcoal"))
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: EmptyView()) {
                        Text("Add to program")
                            .foregroundColor(Color("Orange"))
                    }
                    
                }
                
                VStack(alignment:.leading){
                    HStack(spacing: 0){
                        Button(action: {
                            showMuscleFilter.toggle()
                        }) {
                            HStack {
                                Text("Select muscle group")
                                    .font(.footnote)
                                Image(systemName: "chevron.down")
                                    .rotationEffect(.degrees(showMuscleFilter ? 180 : 0)) // Rotate icon based on visibility
                            }
                            .foregroundColor(Color("Charcoal"))
                            .bold()
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                        }
                        .background(Color("lightGray"))
                        .cornerRadius(60)
                        
                        Spacer()
                        
                        Button(
                            action:{
                                
                            }
                        ){
                            HStack(spacing: 4){
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                Text("Custom")
                                    .font(.footnote)
                            }
                            .foregroundColor(Color("White"))
                            .bold()
                            .padding(.horizontal, 20)
                            .padding(.vertical, 6)
                        }
                        .background(Color("Orange"))
                        .cornerRadius(60)
                    }
                    
                    if showMuscleFilter {
                        VStack{
                            VStack(alignment: .leading, spacing: 0){
                                ForEach(viewModel.exercises.keys.sorted(), id: \.self) { muscleGroup in
                                    Button(action: {
                                        toggleMuscleGroupSelection(muscleGroup)
                                    }) {
                                        HStack {
                                            Text(muscleGroup)
                                                .font(.footnote)

                                            Spacer()
                                            if selectedMuscleGroups.contains(muscleGroup) {
                                                Image(systemName: "checkmark")
                                                    .foregroundColor(Color("Orange"))
                                            }
                                        }
                                        .padding(12)
                                        .foregroundColor(selectedMuscleGroups.contains(muscleGroup) ? Color("Orange") : Color("Charcoal"))
                                        .background(selectedMuscleGroups.contains(muscleGroup) ? Color("Orange").opacity(0.2) : Color.clear)
                                    }
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .frame(width: 200)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color("White"))
                                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 0)
                        )


                    }
                    
                    ScrollView{
                        VStack(spacing: 20){
                            ForEach(filteredExercises.keys.sorted(), id: \.self) { category in
                                   VStack(alignment: .leading) {
                                       Text(category)
                                           .font(.footnote)
                                           .foregroundColor(Color("Orange"))
                                       ForEach(filteredExercises[category]?.sorted(by: { $0.name < $1.name }) ?? [], id: \.self) { exercise in
                                           ExerciseToggleView(
                                               name: exercise.name,
                                               instructions: exercise.instructions,
                                               isSelected: selectedExercises.contains(exercise),
                                               onToggle: {
                                                   toggleExerciseSelection(exercise)
                                               }
                                           )
                                       }
                                   }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.vertical, 32)
            .padding(.horizontal, 24)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("White"))
                    .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 0)
            )
        }
        .padding(.vertical, 100)
        .padding(.horizontal, 20)
    }
    
    
    private func toggleExerciseSelection(_ exercise: Exercise) {
        if selectedExercises.contains(exercise) {
            selectedExercises.remove(exercise)
        } else {
            selectedExercises.insert(exercise)
        }
    }
    
    private func toggleMuscleGroupSelection(_ muscleGroup: String) {
        if selectedMuscleGroups.contains(muscleGroup) {
            selectedMuscleGroups.remove(muscleGroup)
        } else {
            selectedMuscleGroups.insert(muscleGroup)
        }
    }
    
    private var filteredExercises: [String: [Exercise]] {
        if selectedMuscleGroups.isEmpty {
            return viewModel.exercises
        } else {
            return viewModel.exercises.filter { selectedMuscleGroups.contains($0.key) }
        }
    }
}


#Preview {
    SelectExercisesView()
}
