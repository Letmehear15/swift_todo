//
//  TaskRowView.swift
//  todo
//
//  Created by Alex Nesterov on 29.09.2024.
//

import SwiftUI

struct TaskRowView: View {
    
    let task: Task
    let action: () -> Void

    
    var body: some View {
        HStack{
            Text(task.text)
                .fontWeight(.bold)
                .foregroundStyle(task.isComplete ? .gray : .white)
                .animation(.smooth(duration: 0.3), value: task.isComplete)
                .strikethrough(task.isComplete)
            
            Spacer()
            
            Button{
                action()
            } label: {
                Image(systemName: task.isComplete ? "checkmark.circle.fill" : "circle")
                    .animation(.smooth(duration: 0.3), value: task.isComplete)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            .buttonStyle(.borderless)
        }
        .padding()
        .background(task.isComplete ? Color.CustomPrimary.opacity(0.1) : Color.CustomPrimary.opacity(0.25))
        .animation(.smooth(duration: 0.3), value: task.isComplete)
        .cornerRadius(10)
        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

#Preview {
    List{
        TaskRowView(task: Task(text: "Hello, World!", isComplete: false)){
            print("hello")
        }
        TaskRowView(task: Task(text: "Hello, World!", isComplete: true)){}
    }
    .preferredColorScheme(.dark)
    .listRowSpacing(10)
    .listStyle(.plain)
}
