//
//  AppModelContainer.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftData

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
}
