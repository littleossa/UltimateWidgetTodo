//
//  UserDefaultsStoreTests.swift
//  UltimateWidgetTodoTests
//
//

import XCTest
@testable import UltimateWidgetTodo

final class UserDefaultsStoreTests: XCTestCase {
    
    let store = UserDefaultsStore.testStore

    override func tearDownWithError() throws {
        store.removeAll()
    }
    
    func test_defaultValue() {
        
        store.emojiKeyboardIndex = 1
        store.error = .todoItemNameLimitExceeded
        store.frequentlyUsedEmojis = ["😊", "🚀"]
        store.inputText = "Input"
        store.isCapsLocked = true
        store.keyboardInputMode = .emoji
        store.listDisplayIndex = 10
        store.screenType = .addTodoItem
        XCTAssertEqual(store.emojiKeyboardIndex, 1)
        XCTAssertEqual(store.error, .todoItemNameLimitExceeded)
        XCTAssertEqual(store.frequentlyUsedEmojis, ["😊", "🚀"])
        XCTAssertEqual(store.inputText, "Input")
        XCTAssertTrue(store.isCapsLocked)
        XCTAssertEqual(store.keyboardInputMode, .emoji)
        XCTAssertEqual(store.listDisplayIndex, 10)
        XCTAssertEqual(store.screenType, .addTodoItem)
        
        store.removeAll()
        XCTAssertEqual(store.emojiKeyboardIndex, 0)
        XCTAssertNil(store.error)
        XCTAssertTrue(store.frequentlyUsedEmojis.isEmpty)
        XCTAssertEqual(store.inputText, "")
        XCTAssertFalse(store.isCapsLocked)
        XCTAssertEqual(store.keyboardInputMode, .alphabet)
        XCTAssertEqual(store.listDisplayIndex, 0)
        XCTAssertEqual(store.screenType, .main)
    }
    
    func test_emojiKeyboardIndex() {
        XCTAssertEqual(store.emojiKeyboardIndex, 0)
        
        store.emojiKeyboardIndex = 1
        XCTAssertEqual(store.emojiKeyboardIndex, 1)
    }
    
    func test_error() {
        XCTAssertNil(store.error)
        
        store.error = .todoItemDeletionFailure
        XCTAssertEqual(store.error, .todoItemDeletionFailure)
        store.error = .unknown
        XCTAssertEqual(store.error, .unknown)
    }
    
    func test_frequentlyUsedEmojis() {
        XCTAssertTrue(store.frequentlyUsedEmojis.isEmpty)
        
        store.frequentlyUsedEmojis = ["😊", "🚀", "🌟"]
        XCTAssertEqual(store.frequentlyUsedEmojis, ["😊", "🚀", "🌟"])
    }
    
    func test_inputText() {
        
        store.inputText = "Input"
        XCTAssertEqual(store.inputText, "Input")
        store.inputText = ""
        XCTAssertEqual(store.inputText, "")
        store.inputText = "😇"
        XCTAssertEqual(store.inputText, "😇")
    }
    
    func test_isCapsLocked() {
        store.isCapsLocked = true
        XCTAssertTrue(store.isCapsLocked)
        store.isCapsLocked = false
        XCTAssertFalse(store.isCapsLocked)
    }
    
    func test_keyboardInputMode() {
        store.keyboardInputMode = .emoji
        XCTAssertEqual(store.keyboardInputMode, .emoji)
        store.keyboardInputMode = .extraPunctuationMarks
        XCTAssertEqual(store.keyboardInputMode, .extraPunctuationMarks)
        store.keyboardInputMode = .number
        XCTAssertEqual(store.keyboardInputMode, .number)
        store.keyboardInputMode = .alphabet
        XCTAssertEqual(store.keyboardInputMode, .alphabet)
    }
    
    func test_listDisplayIndex() {
        XCTAssertEqual(store.listDisplayIndex, 0)
        
        store.listDisplayIndex = 2
        XCTAssertEqual(store.listDisplayIndex, 2)
    }
    
    func test_screenType() {
        store.screenType = .addTodoItem
        XCTAssertEqual(store.screenType, .addTodoItem)
        let uuid = UUID()
        store.screenType = .editTodoItem(id: uuid)
        XCTAssertEqual(store.screenType, .editTodoItem(id: uuid))
        store.screenType = .main
        XCTAssertEqual(store.screenType, .main)
    }
}
