//
//  KeyboardInputRepository.swift
//  UltimateWidgetTodo
//
//

import Foundation

class KeyboardInputRepository {
    
    init(store: UserDefaultsStore = .shared) {
        self.store = store
    }
    
    private let store: UserDefaultsStore
    
    var inputMode: KeyboardInputMode {
        return store.keyboardInputMode
    }
    
    var inputText: String {
        return store.inputText
    }
    
    var isCapsLocked: Bool {
        return store.isCapsLocked
    }
    
    var isNumberMode: Bool {
        return store.keyboardInputMode == .number
    }
    
    func clearInputText() {
        return store.inputText = ""
    }
    
    func input(_ text: String) {
        store.inputText += text
    }
    
    func changeMode(into mode: KeyboardInputMode) {
        store.keyboardInputMode = mode
    }
    
    func deleteLastCharacter() {
        var inputText = store.inputText
        guard !inputText.isEmpty
        else { return }
        inputText.removeLast()
        store.inputText = inputText
    }
    
    func toggleCapsLock() {
        store.isCapsLocked.toggle()
    }
}
