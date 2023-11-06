//
//  SwiftDataStore.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import Foundation
import SwiftData

@MainActor
class SwiftDataStore {
    
    private init(isTesting: Bool) {
        let schema = Schema([
            Task.self,
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
    
    static let shared = SwiftDataStore(isTesting: false)
    static let testStore = SwiftDataStore(isTesting: true)
    
    let container: ModelContainer
    
    func addTask(name: String, createDate: Date = Date()) {
        let newTask = Task(name: name, createDate: createDate)
        container.mainContext.insert(newTask)
    }
    
    func deleteTask(id: UUID) throws {
        let task = try fetchTask(id: id)
        container.mainContext.delete(task)
    }
    
    func fetchTask(id: UUID) throws -> Task {
        let descriptor = FetchDescriptor<Task>(predicate: #Predicate { $0.taskId == id })
        if let task = try container.mainContext.fetch(descriptor).first {
            return task
        } else {
            // TODO: throw error
            throw NSError(domain: "todo item not found", code: 1)
        }
    }
    
    func makePreviewContainer(taskCount: Int) -> ModelContainer {
        guard taskCount > 0 else {
            return container
        }
        
        for i in 1...taskCount {
            addTask(name: "Example Item \(i)")
        }
        return container
    }
}
