//
//  ScreenManager.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import Foundation

class ScreenManager {
    
    static let shared = ScreenManager(store: .shared)
    static let test = ScreenManager(store: .testStore)
    
    static let screenTypeKey = UserDefaultsStore.Key.screenType.rawValue
    
    private init(store userDefaultsStore: UserDefaultsStore) {
        self.userDefaultsStore = userDefaultsStore
    }
    
    private let userDefaultsStore: UserDefaultsStore
    
    var currentScreen: ScreenType {
        return userDefaultsStore.screenType
    }
    
    func switchToScreen(_ type: ScreenType) {
        
        if type == .addTask {
            // creating a new task item, start with an uppercase letter.
            userDefaultsStore.isCapsLocked = true
        }
        userDefaultsStore.screenType = type
    }
}
