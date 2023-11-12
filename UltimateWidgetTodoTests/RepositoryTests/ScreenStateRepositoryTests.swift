//
//  ScreenStateRepositoryTests.swift
//  UltimateWidgetTodoTests
//
//

import XCTest
@testable import UltimateWidgetTodo

final class ScreenStateRepositoryTests: XCTestCase {
    
    let repository = ScreenStateRepository(store: .testStore)
    let store = UserDefaultsStore.testStore
    
    override func setUpWithError() throws {
        store.removeAll()
    }
    
    func test_currentScreen() {
        XCTAssertEqual(repository.currentScreen, .main)
        store.screenType = .addTodoItem
        XCTAssertEqual(repository.currentScreen, .addTodoItem)
    }
    
    func test_changeScreen() {
        repository.changeScreen(into: .addTodoItem)
        XCTAssertEqual(repository.currentScreen, .addTodoItem)
        
        repository.changeScreen(into: .main)
        XCTAssertEqual(repository.currentScreen, .main)
        
        let uuid = UUID()
        repository.changeScreen(into: .editTodoItem(id: uuid))
        XCTAssertEqual(repository.currentScreen, .editTodoItem(id: uuid))
    }
    
    func test_error() {
        let repository = ScreenStateRepository()
        XCTAssertNil(repository.error)
        
        let error = WidgetError.todoItemNameLimitExceeded
        repository.setError(error)
        XCTAssertEqual(repository.error, error)
        
        repository.resetError()
        XCTAssertNil(repository.error)
    }
}
