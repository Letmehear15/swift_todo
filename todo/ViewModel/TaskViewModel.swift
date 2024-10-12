//
//  TaskViewModel.swift
//  todo
//
//  Created by Alex Nesterov on 02.10.2024.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject, Identifiable {
    @Published var taskText: String = ""
    @Published var tasks: [Task] = [Task(text: "To do"), Task(text: "to do 2"),Task(text: "To do"), Task(text: "to do 2"),Task(text: "To do"), Task(text: "to do 2"),Task(text: "To do"), Task(text: "to do 2"),Task(text: "To do"), Task(text: "to do 2")]
    @Published var selectedTask: Task?
    
    func addNewTask(newTask: String) {
        guard !newTask.isEmpty else { return }
        self.tasks.insert(Task(text: newTask), at: 0)
        self.taskText = ""
    }
    
    func deleteTask(at index: IndexSet) {
        self.tasks.remove(atOffsets: index)
    }
    
    func toggleTask(at index: Int) {
        withAnimation(.smooth) {
            self.tasks[index].isComplete.toggle()
            let completedTasks = self.tasks.filter{ item in
                return item.isComplete
            }
            
            let uncomplittedTasks = self.tasks.filter{ item in
                return !item.isComplete
            }
            
            self.tasks = [uncomplittedTasks, completedTasks].flatMap{$0}
        }
    }
    
    func changeTaskText(at id: UUID, newText: String) {
        guard !newText.isEmpty else { return }
        
        if let index = self.tasks.firstIndex(where: {$0.id == id}) {
            self.tasks[index].text = newText
        }
    }
    
    func selectTask(at index: Int) {
        self.selectedTask = self.tasks[index]
        self.taskText = self.selectedTask!.text
    }
}
