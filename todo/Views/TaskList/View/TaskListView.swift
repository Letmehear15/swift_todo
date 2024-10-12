//
//  HomeScreen.swift
//  todo
//
//  Created by Alex Nesterov on 29.09.2024.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var tasksViewModel: TaskViewModel
    @State private var isEditDrawerOpen = false
    
    @State var isAnimated = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: [.CustomBackground1, .CustomBackground2], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                List {
                    ForEach(Array(tasksViewModel.tasks.enumerated()), id: \.element.id) {index, task in
                        TaskRowView(task: task, action: {
                            tasksViewModel.toggleTask(at: index)
                            tasksViewModel.selectTask(at: index)
                        })
                        .onTapGesture {
                            isEditDrawerOpen.toggle()
                        }
                    }
                    .onDelete(perform: tasksViewModel.deleteTask)
                }
                .listStyle(.plain)
                .listRowSpacing(18)
            }
            .navigationTitle("To Do List")
            .sheet(isPresented: $isEditDrawerOpen){
                BottomSheetView()
                    .presentationDragIndicator(.visible)
            }
            .toolbar{
                NavigationLink(destination: CreateTaskView()) {
                    Image(systemName: "plus")
                }
            }
            .opacity(isAnimated ? 1 : 0)
            .animation(.smooth, value: isAnimated)
            .onAppear(){
                isAnimated = true
            }
        }
    }
}

#Preview {
    TaskListView()
        .preferredColorScheme(.dark)
        .environmentObject(TaskViewModel())
}
