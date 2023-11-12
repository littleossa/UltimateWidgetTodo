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
    
    var error: WidgetError? {
        return store.error
    }
    
    func changeScreen(into type: ScreenType) {
        store.screenType = type
    }
    
    func setError(_ error: WidgetError) {
        store.error = error
    }
    
    func resetError() {
        store.error = nil
    }
}
