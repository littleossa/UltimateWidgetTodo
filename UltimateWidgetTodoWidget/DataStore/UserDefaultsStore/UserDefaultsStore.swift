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
        case editTodoItemId
        case emojiKeyboardIndex
        case error
        case frequentlyUsedEmojis
        case inputText
        case isCapsLocked
        case keyboardInputMode
        case listDisplayIndex
        case screenType
    }
    
    /// The ID required to navigate to the todo item editing screen
    private var editTodoItemId: UUID? {
        get {
            guard let value = userDefaults.string(forKey: Key.editTodoItemId.rawValue),
                  let uuid = UUID(uuidString: value)
            else { return nil }
            
            return uuid
        }
        set {
            userDefaults.set(newValue?.uuidString, forKey: Key.editTodoItemId.rawValue)
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
            case ScreenType.addTodoItem.screenName:
                return .addTodoItem
            case ScreenType.editTodoItem(id: UUID()).screenName:
                
                if let editTodoItemId {
                    return .editTodoItem(id: editTodoItemId)
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
            case .main, .addTodoItem:
                break
            case .editTodoItem(let id):
                editTodoItemId = id
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
