//
//  UserDefaultsStore.swift
//  UltimateWidgetTodo
//
//

import Foundation

class UserDefaultsStore {
    
    static let shared = UserDefaultsStore()
    static let testStore = UserDefaultsStore(isTesting: true)
    
    private init(isTesting: Bool = false) {
        let suiteName = isTesting ? "testStore" : "widgetTodo"
        userDefaults = UserDefaults(suiteName: suiteName) ?? UserDefaults()
    }
    
    private let userDefaults: UserDefaults
    
    enum Key: String, CaseIterable {
        case inputText
        case isCapsLocked
        case isShownKeyboard
        case keyboardInputMode
    }
    
    var inputText: String {
        get {
            return userDefaults.string(forKey: Key.inputText.rawValue) ?? ""
        }
        set {
            userDefaults.set(newValue, forKey: Key.inputText.rawValue)
        }
    }
    
    var isCapsLocked: Bool {
        get {
            return userDefaults.bool(forKey: Key.isCapsLocked.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.isCapsLocked.rawValue)
        }
    }
    
    var isShownKeyboard: Bool {
        get {
            return userDefaults.bool(forKey: Key.isShownKeyboard.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.isShownKeyboard.rawValue)
        }
    }
    
    var keyboardInputMode: KeyboardInputMode {
        get {
            let value = userDefaults.string(forKey: Key.keyboardInputMode.rawValue) ?? ""
            if let mode = KeyboardInputMode(rawValue: value) {
                return mode
            }
            return .alphabet
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: Key.keyboardInputMode.rawValue)
        }
    }
    
    func removeAll() {
        Key.allCases.forEach {
            userDefaults.removeObject(forKey: $0.rawValue)
        }
    }
}
