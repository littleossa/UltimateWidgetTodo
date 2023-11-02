//
//  KeyboardInputManager.swift
//  UltimateWidgetTodo
//
//

import Foundation

class KeyboardInputManager {
    
    static let shared = KeyboardInputManager(store: .shared)
    static let test = KeyboardInputManager(store: .testStore)
    
    private init(store userDefaultsStore: UserDefaultsStore) {
        self.userDefaultsStore = userDefaultsStore
    }
    
    private let userDefaultsStore: UserDefaultsStore
}
