//
//  CreateTask.swift
//  todo
//
//  Created by Alex Nesterov on 29.09.2024.
//

import SwiftUI

struct CreateTaskView: View {
    
    @EnvironmentObject var viewModel: TaskViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.CustomBackground1, .CustomBackground2], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack{
                CustomTextField(placeholder: "Enter your new task")
                                
                CustomButton(bauttonText: "Add task"){
                    viewModel.addNewTask(newTask: viewModel.taskText)
                    dismiss()
                }
                
                Spacer()
                
            }
            .navigationTitle("Add Task")
            .toolbarTitleDisplayMode(.inline)
            .padding()
            .onAppear {
                viewModel.taskText = ""
            }
        }
    }
}

#Preview {
    NavigationStack {
        CreateTaskView().preferredColorScheme(.dark).environmentObject(TaskViewModel())
    }
    
}
