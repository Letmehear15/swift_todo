//
//  CustomButton.swift
//  todo
//
//  Created by Alex Nesterov on 12.10.2024.
//

import SwiftUI

struct CustomButton: View {
    
    let bauttonText: String
    
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(bauttonText)
                .frame(maxWidth: .infinity)
                .padding()
                .font(.headline)
                .foregroundStyle(Color.CustomBackground1)
                .background(.accent)
                .cornerRadius(10)
        }
    }
}

#Preview {
    CustomButton(bauttonText: "Add task"){
        
    }
}
