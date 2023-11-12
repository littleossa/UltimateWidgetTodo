//
//  SwiftDataStore.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import Foundation
import SwiftData

class SwiftDataStore {
    
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
    
    static let shared = SwiftDataStore(isTesting: false)
    static let testStore = SwiftDataStore(isTesting: true)
    
    let container: ModelContainer
    
    @MainActor
    var context: ModelContext {
        return container.mainContext
    }
}
