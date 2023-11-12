//
//  ListDisplayRepositoryTests.swift
//  UltimateWidgetTodoTests
//
//

import XCTest
@testable import UltimateWidgetTodo

final class ListDisplayRepositoryTests: XCTestCase {
    
    let repository = ListDisplayRepository(store: .testStore)
    let store = UserDefaultsStore.testStore
    
    override func setUpWithError() throws {
        store.removeAll()
    }
    
    func test_scrollDownList() {
        let initialIndex = repository.currentIndex
        repository.scrollDownList()
        XCTAssertEqual(repository.currentIndex, initialIndex + 1)
    }
    
    func test_scrollUpList() {
        store.listDisplayIndex = 10
        let initialIndex = repository.currentIndex
        repository.scrollUpList()
        XCTAssertEqual(repository.currentIndex, initialIndex - 1)
    }
    
    func test_updateIndex() {
        repository.updateIndex(to: 5)
        XCTAssertEqual(repository.currentIndex, 5)
        repository.updateIndex(to: 10)
        XCTAssertEqual(repository.currentIndex, 10)
    }
}
