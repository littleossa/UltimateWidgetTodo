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
        case emojiKeyboardIndex
        case error
        case frequentlyUsedEmojis
        case inputText
        case isCapsLocked
        case keyboardInputMode
        case listDisplayIndex
        case screenType
    }
    
    /// The ID required to navigate to the task editing screen
    private var editTaskId: UUID? {
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
    
    var emojiKeyboardIndex: Int {
        get {
            return userDefaults.integer(forKey: Key.emojiKeyboardIndex.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.emojiKeyboardIndex.rawValue)
        }
    }
    
    var error: WidgetError? {
        get {
            let value = userDefaults.string(forKey: Key.error.rawValue) ?? ""
            return WidgetError(rawValue: value)
        }
        set {
            let value = newValue?.rawValue ?? ""
            userDefaults.set(value, forKey: Key.error.rawValue)
        }
    }
    
    var frequentlyUsedEmojis: [String] {
        get {
            let emojis = userDefaults.stringArray(forKey: Key.frequentlyUsedEmojis.rawValue)
            return emojis ?? []
        }
        set {
            userDefaults.set(newValue, forKey: Key.frequentlyUsedEmojis.rawValue)
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
    
    var listDisplayIndex: Int {
        get {
            return userDefaults.integer(forKey: Key.listDisplayIndex.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.listDisplayIndex.rawValue)
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
                print("This screen name is not defined")
                return .main
            }
        }
        set {
            switch newValue {
            case .main, .addTask:
                break
            case .editTask(let id):
                editTaskId = id
            }
            userDefaults.set(newValue.screenName, forKey: Key.screenType.rawValue)
        }
    }
    
    func removeAll() {
        Key.allCases.forEach {
            userDefaults.removeObject(forKey: $0.rawValue)
        }
    }
}
