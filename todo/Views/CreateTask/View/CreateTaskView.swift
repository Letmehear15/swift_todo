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
                TextField("Enter your new task", text: $viewModel.taskText)
                    .font(.headline)
                    .padding()
                    .background(Color.CustomPrimary.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.bottom, 8)
                
                Button(action: {
                    viewModel.addNewTask(newTask: viewModel.taskText)
                    dismiss()
                }) {
                    Text("Add task")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .font(.headline)
                        .foregroundStyle(Color.CustomBackground1)
                        .background(.accent)
                        .cornerRadius(10)
                }
                
                Spacer()
                
            }
            .navigationTitle("Add Task")
            .toolbarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        CreateTaskView().preferredColorScheme(.dark).environmentObject(TaskViewModel())
    }
    
}
