//
//  AppModelContainer.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import Foundation
import SwiftData

@MainActor
class AppModelContainer {
    
    private init(isTesting: Bool) {
        let schema = Schema([
            TodoItem.self,
        ])
        let configuration = ModelConfiguration(schema: schema,
                                               isStoredInMemoryOnly: isTesting)
        
        do {
            container = try ModelContainer(for: schema,
                                           configurations: [configuration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    static let shared = AppModelContainer(isTesting: false)
    static let testStore = AppModelContainer(isTesting: true)
    
    let container: ModelContainer
    
    func addItem(name: String, createDate: Date = Date()) {
        let newItem = TodoItem(name: name, createDate: createDate)
        container.mainContext.insert(newItem)
    }
    
    func deleteItem(id: UUID) throws {
        let item = try fetchTodoItem(id: id)
        container.mainContext.delete(item)
    }
    
    func fetchTodoItem(id: UUID) throws -> TodoItem {
        let descriptor = FetchDescriptor<TodoItem>(predicate: #Predicate { $0.itemId == id })
        if let item = try container.mainContext.fetch(descriptor).first {
            return item
        } else {
            // TODO: throw error
            throw NSError(domain: "todo item not found", code: 1)
        }
    }
}
