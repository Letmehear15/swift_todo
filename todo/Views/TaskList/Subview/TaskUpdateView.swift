//
//  TaskUpdateView.swift
//  todo
//
//  Created by Alex Nesterov on 12.10.2024.
//

import SwiftUI

struct TaskUpdateView: View {
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            CustomTextField(placeholder: "Edit task")
            
            CustomButton(bauttonText: "Edit", action: {
                taskViewModel.changeTaskText(at: taskViewModel.selectedTask!.id, newText: taskViewModel.taskText)
                dismiss()
            })
            
            Spacer()
        }
        .padding()
        .padding(.top)
        .navigationTitle("Add Task")
        .toolbarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    NavigationStack{
        TaskUpdateView()
            .environmentObject(TaskViewModel())
            .preferredColorScheme(.dark)
    }
}

