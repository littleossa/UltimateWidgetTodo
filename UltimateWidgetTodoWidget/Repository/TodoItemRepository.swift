//
//  TodoItemRepository.swift
//  UltimateWidgetTodo
//
//

import Foundation
import SwiftData

class TodoItemRepository {
    
    init(store: SwiftDataStore = .shared) {
        self.store = store
    }
    
    private let store: SwiftDataStore
    
    var container: ModelContainer {
        store.container
    }
    
    @MainActor
    func addItem(name: String, createDate: Date = Date()) {
        let newItem = TodoItem(name: name, createDate: createDate)
        store.context.insert(newItem)
    }
    
    @MainActor
    func deleteItem(id: UUID) throws {
        let item = try fetchItem(id: id)
        store.context.delete(item)
    }
    
    @MainActor
    func fetchItem(id: UUID) throws -> TodoItem {
        let descriptor = FetchDescriptor<TodoItem>(predicate: #Predicate { $0.itemId == id })
        if let item = try store.context.fetch(descriptor).first {
            return item
        } else {
            // TODO: throw error
            throw NSError(domain: "todo item not found", code: 1)
        }
    }
}
