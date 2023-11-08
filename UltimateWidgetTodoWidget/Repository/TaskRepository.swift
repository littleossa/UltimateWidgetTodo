//
//  TaskRepository.swift
//  UltimateWidgetTodo
//
//

import Foundation
import SwiftData

class TaskRepository {
    
    init(store: SwiftDataStore = .shared) {
        self.store = store
    }
    
    private let store: SwiftDataStore
    
    @MainActor
    func addTask(name: String, createDate: Date = Date()) {
        let newTask = Task(name: name, createDate: createDate)
        store.context.insert(newTask)
    }
    
    @MainActor
    func deleteTask(id: UUID) throws {
        let task = try fetchTask(id: id)
        store.context.delete(task)
    }
    
    @MainActor
    func fetchTask(id: UUID) throws -> Task {
        let descriptor = FetchDescriptor<Task>(predicate: #Predicate { $0.taskId == id })
        if let task = try store.context.fetch(descriptor).first {
            return task
        } else {
            // TODO: throw error
            throw NSError(domain: "todo item not found", code: 1)
        }
    }
}
