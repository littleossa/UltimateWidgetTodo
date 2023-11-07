//
//  Task.swift
//  UltimateWidgetTodo
//
//

import Foundation
import SwiftData

@Model
final class Task {
    let taskId: UUID
    var name: String
    let createDate: Date
    var updateDate: Date
    
    init(name: String, createDate: Date) {
        self.taskId = UUID()
        self.name = name
        self.createDate = createDate
        self.updateDate = createDate
    }
}
