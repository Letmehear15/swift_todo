//
//  BottomSheet.swift
//  todo
//
//  Created by Alex Nesterov on 05.10.2024.
//

import SwiftUI

struct BottomSheetView: View {
    
    @EnvironmentObject var viewModel: TaskViewModel

    
    var body: some View {
//        TextField("Task text", text: $taskToChange.text)
        Text("aa")
    }
}

#Preview {
    BottomSheetView()
        .preferredColorScheme(.dark)
        .environmentObject(TaskViewModel())
}
