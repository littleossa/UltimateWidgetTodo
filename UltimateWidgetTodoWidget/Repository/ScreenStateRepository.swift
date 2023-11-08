//
//  ScreenStateRepository.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import Foundation

class ScreenStateRepository {
            
    init(store: UserDefaultsStore = .shared) {
        self.store = store
    }
    
    private let store: UserDefaultsStore
    
    var currentScreen: ScreenType {
        return store.screenType
    }
    
    func changeScreen(into type: ScreenType) {
        store.screenType = type
    }
}
