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
        
        store.inputText = "Input"
        store.isCapsLocked = true
        store.isShownKeyboard = true
        store.keyboardInputMode = .emoji
        XCTAssertEqual(store.inputText, "Input")
        XCTAssertTrue(store.isCapsLocked)
        XCTAssertTrue(store.isShownKeyboard)
        XCTAssertEqual(store.keyboardInputMode, .emoji)
        
        store.removeAll()
        
        XCTAssertEqual(store.inputText, "")
        XCTAssertFalse(store.isCapsLocked)
        XCTAssertFalse(store.isShownKeyboard)
        XCTAssertEqual(store.keyboardInputMode, .alphabet)
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
    
    func test_isShownKeyboard() {
        store.isShownKeyboard = true
        XCTAssertTrue(store.isShownKeyboard)
        store.isShownKeyboard = false
        XCTAssertFalse(store.isShownKeyboard)
    }
    
    func test_keyboardInputMode() {
        store.keyboardInputMode = .emoji
        XCTAssertEqual(store.keyboardInputMode, .emoji)
        store.keyboardInputMode = .number
        XCTAssertEqual(store.keyboardInputMode, .number)
        store.keyboardInputMode = .alphabet
        XCTAssertEqual(store.keyboardInputMode, .alphabet)
    }
}
