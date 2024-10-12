//
//  ContentView.swift
//  todo
//
//  Created by Alex Nesterov on 29.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskListView()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
        .environmentObject(TaskViewModel())
}
