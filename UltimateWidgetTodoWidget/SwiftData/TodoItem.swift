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
    let createDate: Date
    var updateDate: Date
    
    init(createDate: Date) {
        self.itemId = UUID()
        self.createDate = createDate
        self.updateDate = createDate
    }
}
