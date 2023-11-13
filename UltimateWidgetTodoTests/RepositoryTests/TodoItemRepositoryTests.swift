//
//  TodoItemRepositoryTests.swift
//  UltimateWidgetTodoTests
//
//

import SwiftData
import XCTest
@testable import UltimateWidgetTodo

final class TodoItemRepositoryTests: XCTestCase {
    
    @MainActor
    override func setUpWithError() throws {
        SwiftDataStore.testStore.clear()
    }
    
    @MainActor
    func test_addItem() {
        let repository = TodoItemRepository(store: .testStore)
        SwiftDataStore.testStore.clear()

        var items = SwiftDataStore.testStore.fetchItem()
        XCTAssertEqual(items.count, 0)
        let itemName = "Test Item"
        repository.addItem(name: itemName)
        items = SwiftDataStore.testStore.fetchItem()
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items[0].name, itemName)
        let itemName2 = "Test Item2"
        repository.addItem(name: itemName2)
        items = SwiftDataStore.testStore.fetchItem()
        XCTAssertEqual(items.count, 2)
        XCTAssertEqual(items[0].name, itemName2)
        XCTAssertEqual(items[1].name, itemName)
    }
    
    @MainActor
    func test_deleteItem() {
        let repository = TodoItemRepository(store: .testStore)
        SwiftDataStore.testStore.clear()

        let itemName = "Item to be deleted"
        repository.addItem(name: itemName)
        var items = SwiftDataStore.testStore.fetchItem()
        XCTAssertEqual(items.count, 1)
        let id = items[0].itemId
        
        do {
            try repository.deleteItem(id: id)
            items = SwiftDataStore.testStore.fetchItem()
            XCTAssertEqual(items.count, 0)
        } catch {
            XCTFail("Failed to delete the item: \(error)")
        }
    }
    
    @MainActor
    func test_fetchItem() {
        let repository = TodoItemRepository(store: .testStore)
        SwiftDataStore.testStore.clear()

        let itemName = "Test Item"
        repository.addItem(name: itemName)
        let items = SwiftDataStore.testStore.fetchItem()
        XCTAssertEqual(items.count, 1)
        let id = items[0].itemId
        
        let itemName2 = "Test Item2"
        repository.addItem(name: itemName2)
        do {
            let fetchedItem = try repository.fetchItem(id: id)
            XCTAssertEqual(items[0].name, fetchedItem.name)
        } catch {
            XCTFail("Failed to fetch the item: \(error)")
        }
    }
}
