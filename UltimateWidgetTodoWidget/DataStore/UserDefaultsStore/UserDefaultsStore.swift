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
    
    private(set) var userDefaults: UserDefaults
    
    enum Key: String, CaseIterable {
        case inputText
        case isCapsLocked
        case isShownKeyboard
        case keyboardInputMode
        case screenType
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
    
    var screenType: ScreenType {
        get {
            let value = userDefaults.string(forKey: Key.screenType.rawValue) ?? ""
            if let type = ScreenType(rawValue: value) {
                return type
            }
            return .todoList
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: Key.screenType.rawValue)
        }
    }
    
    func removeAll() {
        Key.allCases.forEach {
            userDefaults.removeObject(forKey: $0.rawValue)
        }
    }
}

enum ScreenType: String {
    case todoList
    case addItem
    case editItem
}
