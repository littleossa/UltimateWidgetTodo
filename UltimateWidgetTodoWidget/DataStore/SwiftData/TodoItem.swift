//
//  TodoItem.swift
//  UltimateWidgetTodo
//
//

import Foundation
import SwiftData

@Model
final class TodoItem {
    let itemId: UUID
    var name: String
    let createDate: Date
    var updateDate: Date
    
    init(name: String, createDate: Date) {
        self.itemId = UUID()
        self.name = name
        self.createDate = createDate
        self.updateDate = createDate
    }
}
