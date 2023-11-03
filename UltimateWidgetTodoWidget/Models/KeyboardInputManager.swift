//
//  KeyboardInputManager.swift
//  UltimateWidgetTodo
//
//

import Foundation

extension KeyboardInputManager {
    static let topRowLetters = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
    static let centerRowLetters = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
    static let bottomRowLetters = ["Z", "X", "C", "V", "B", "N", "M"]
}

class KeyboardInputManager {
    
    static let shared = KeyboardInputManager(store: .shared)
    static let test = KeyboardInputManager(store: .testStore)
        
    private init(store userDefaultsStore: UserDefaultsStore) {
        self.userDefaultsStore = userDefaultsStore
    }
    
    private let userDefaultsStore: UserDefaultsStore
    
    var inputText: String {
        return userDefaultsStore.inputText
    }
    
    var isCapsLocked: Bool {
        return userDefaultsStore.isCapsLocked
    }
    
    func clearInputText() {
        return userDefaultsStore.inputText = ""
    }
    
    func input(_ character: String) {
        userDefaultsStore.inputText += character        
    }
    
    func toggleCapsLock() {
        userDefaultsStore.isCapsLocked.toggle()
    }
}
