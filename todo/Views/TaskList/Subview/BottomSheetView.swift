//
//  BottomSheet.swift
//  todo
//
//  Created by Alex Nesterov on 05.10.2024.
//

import SwiftUI

struct BottomSheetView: View {    
    var body: some View {
        TaskUpdateView()
    }
}

#Preview {
    BottomSheetView()
        .preferredColorScheme(.dark)
        .environmentObject(TaskViewModel())
}
