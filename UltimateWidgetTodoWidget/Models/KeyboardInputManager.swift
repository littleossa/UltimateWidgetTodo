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
    // MARK: - Extra punctuation marks mode keys
    static let topRowExtraPunctuationMarks = ["[", "]", "{", "}", "#" , "%", "^", "*", "+", "="]
    static let centerRowExtraPunctuationMarks = ["_", "\\", "|", "~", "<" , ">", "€", "£", "¥", "•"]
    
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
    
    var isNumberMode: Bool {
        return userDefaultsStore.keyboardInputMode == .number
    }
    
    func clearInputText() {
        return userDefaultsStore.inputText = ""
    }
    
    func input(_ text: String) {
        userDefaultsStore.inputText += text
    }
    
    func changeMode(into mode: KeyboardInputMode) {
        userDefaultsStore.keyboardInputMode = mode
    }
    
    func deleteLastCharacter() {
        var inputText = userDefaultsStore.inputText
        guard !inputText.isEmpty
        else { return }
        inputText.removeLast()
        userDefaultsStore.inputText = inputText
    }
    
    func toggleCapsLock() {
        userDefaultsStore.isCapsLocked.toggle()
    }
}
