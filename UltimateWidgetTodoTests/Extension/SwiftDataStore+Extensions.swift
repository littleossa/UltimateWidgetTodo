//
//  SwiftDataStore+Extensions.swift
//  UltimateWidgetTodoTests
//
//

import SwiftData
import XCTest

@testable import UltimateWidgetTodo

extension SwiftDataStore {
    
    @MainActor
    func fetchItem() -> [TodoItem] {
        let descriptor = FetchDescriptor<TodoItem>()
        let items = try? self.context.fetch(descriptor)
        return items ?? []
    }
    
    func createItems(count: Int) -> [TodoItem] {
        var items: [TodoItem] = []
        for i in 0..<count {
            let newItem = TodoItem(name: "\(i)", createDate: Date())
            items.append(newItem)
        }
        return items
    }
}

