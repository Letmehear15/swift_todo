//
//  CustomTextField.swift
//  todo
//
//  Created by Alex Nesterov on 12.10.2024.
//

import SwiftUI

struct CustomTextField: View {
    
    let placeholder: String
    
    @EnvironmentObject var viewModel: TaskViewModel
    
    var body: some View {
        TextField(placeholder, text: $viewModel.taskText)
            .font(.headline)
            .padding()
            .background(Color.CustomPrimary.opacity(0.1))
            .cornerRadius(10)
            .padding(.bottom, 8)
        
        
    }
}

#Preview {
    CustomTextField(placeholder: "Test")
        .environmentObject(TaskViewModel())
        .preferredColorScheme(.dark)
}
