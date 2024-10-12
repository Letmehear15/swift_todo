//
//  TaskModel.swift
//  todo
//
//  Created by Alex Nesterov on 29.09.2024.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var text: String
    var isComplete: Bool = false
}
