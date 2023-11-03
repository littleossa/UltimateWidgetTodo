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
        store.addItemViewIsPresented = true
        store.keyboardInputMode = .emoji
        store.screenType = .addItem
        XCTAssertEqual(store.inputText, "Input")
        XCTAssertTrue(store.isCapsLocked)
        XCTAssertTrue(store.addItemViewIsPresented)
        XCTAssertEqual(store.keyboardInputMode, .emoji)
        XCTAssertEqual(store.screenType, .addItem)
        
        store.removeAll()
        
        XCTAssertEqual(store.inputText, "")
        XCTAssertFalse(store.isCapsLocked)
        XCTAssertFalse(store.addItemViewIsPresented)
        XCTAssertEqual(store.keyboardInputMode, .alphabet)
        XCTAssertEqual(store.screenType, .todoList)
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
    
    func test_addItemViewIsPresented() {
        store.addItemViewIsPresented = true
        XCTAssertTrue(store.addItemViewIsPresented)
        store.addItemViewIsPresented = false
        XCTAssertFalse(store.addItemViewIsPresented)
    }
    
    func test_keyboardInputMode() {
        store.keyboardInputMode = .emoji
        XCTAssertEqual(store.keyboardInputMode, .emoji)
        store.keyboardInputMode = .number
        XCTAssertEqual(store.keyboardInputMode, .number)
        store.keyboardInputMode = .alphabet
        XCTAssertEqual(store.keyboardInputMode, .alphabet)
    }
    
    func test_screenType() {
        store.screenType = .addItem
        XCTAssertEqual(store.screenType, .addItem)
        store.screenType = .editItem
        XCTAssertEqual(store.screenType, .editItem)
        store.screenType = .todoList
        XCTAssertEqual(store.screenType, .todoList)
    }
}
