//
//  KeyboardInputManager.swift
//  UltimateWidgetTodo
//
//

import Foundation

extension KeyboardInputManager {
    // MARK: - Alphabet mode keys
    static let topRowAlphabets = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
    static let centerRowAlphabets = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
    static let bottomRowAlphabets = ["Z", "X", "C", "V", "B", "N", "M"]
    
    // MARK: - Number mode keys
    static let topRowNumbers = ["1", "2", "3", "4", "5" , "6", "7", "8", "9", "0"]
    static let centerRowPunctuationMarks = ["-", "/", ":", ";", "(" , ")", "$", "&", "@", "“"]
    static let bottomRowPunctuationMarks = [".", ",", "?", "!", "‘"]
}

class KeyboardInputManager {
    
    static let shared = KeyboardInputManager(store: .shared)
    static let test = KeyboardInputManager(store: .testStore)
        
    private init(store userDefaultsStore: UserDefaultsStore) {
        self.userDefaultsStore = userDefaultsStore
    }
    
    private let userDefaultsStore: UserDefaultsStore
    
    var inputMode: KeyboardInputMode {
        return userDefaultsStore.keyboardInputMode
    }
    
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
    
    func changeMode(into mode: KeyboardInputMode) {
        userDefaultsStore.keyboardInputMode = mode
    }
    
    func toggleCapsLock() {
        userDefaultsStore.isCapsLocked.toggle()
    }
}
