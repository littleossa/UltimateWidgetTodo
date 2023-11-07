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
        case editTaskId
        case inputText
        case isCapsLocked
        case keyboardInputMode
        case screenType
    }
    
    var editTaskId: UUID? {
        get {
            guard let value = userDefaults.string(forKey: Key.editTaskId.rawValue),
                  let uuid = UUID(uuidString: value)
            else { return nil }
            
            return uuid
        }
        set {
            userDefaults.set(newValue?.uuidString, forKey: Key.editTaskId.rawValue)
        }
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
            
            switch value {
            case ScreenType.main.screenName:
                return .main
            case ScreenType.addTask.screenName:
                return .addTask
            case ScreenType.editTask(id: UUID()).screenName:
                
                if let editTaskId {
                    return .editTask(id: editTaskId)
                } else {
                    fatalError("The screen name cannot be retrieved due to the lack of an editing ID")
                }
                
            default:
                fatalError("This screen name is not defined")
            }
        }
        set {
            userDefaults.set(newValue.screenName, forKey: Key.screenType.rawValue)
        }
    }
    
    func removeAll() {
        Key.allCases.forEach {
            userDefaults.removeObject(forKey: $0.rawValue)
        }
    }
}
