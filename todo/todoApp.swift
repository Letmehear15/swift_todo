//
//  todoApp.swift
//  todo
//
//  Created by Alex Nesterov on 29.09.2024.
//

import SwiftUI

@main
struct todoApp: App {
    @StateObject var viewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .preferredColorScheme(.dark)
        }
    }
}
