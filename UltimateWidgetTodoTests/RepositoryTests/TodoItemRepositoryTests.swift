//
//  TodoItemRepositoryTests.swift
//  UltimateWidgetTodoTests
//
//

import SwiftData
import XCTest
@testable import UltimateWidgetTodo

final class TodoItemRepositoryTests: XCTestCase {
    
    let repository = TodoItemRepository(store: .testStore)
    
    @MainActor
    func testAddItem() {
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
        XCTAssertEqual(items[1].name, itemName2)
    }
    
    @MainActor
    func test_deleteItem() {
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

extension SwiftDataStore {
    
    @MainActor
    func fetchItem() -> [TodoItem] {
        let descriptor = FetchDescriptor<TodoItem>()
        let items = try? self.context.fetch(descriptor)
        return items ?? []
    }
    
    func createItems(count: Int) -> [TodoItem] {
        var items: [TodoItem] = []
        for i in 0..<count {
            let newItem = TodoItem(name: "\(i)", createDate: Date())
            items.append(newItem)
        }
        return items
    }
}
