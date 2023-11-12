//
//  ListControlTests.swift
//  UltimateWidgetTodoTests
//
//

import XCTest
@testable import UltimateWidgetTodo

final class ListControlTests: XCTestCase {
    
    let testStore: SwiftDataStore = .testStore
    
    func test_canAppearScrollButtons() {
        
        XCTContext.runActivity(named: "Items count is less than display limit") { _ in
            let items = createItems(count: WidgetConfig.displayTodoItemLimitCount - 1)
            let control = ListDisplayControl(currentIndex: 0, items: items)
            XCTAssertFalse(control.canAppearScrollButtons)
        }
        
        XCTContext.runActivity(named: "Items count is equal to display limit") { _ in
            let items = createItems(count: WidgetConfig.displayTodoItemLimitCount)
            let control = ListDisplayControl(currentIndex: 0, items: items)
            XCTAssertFalse(control.canAppearScrollButtons)
        }
        
        XCTContext.runActivity(named: "Items count is greater than display limit") { _ in
            let items = createItems(count: WidgetConfig.displayTodoItemLimitCount + 1)
            let control = ListDisplayControl(currentIndex: 0, items: items)
            XCTAssertTrue(control.canAppearScrollButtons)
        }
    }
    
    func test_displayItems() {
        
        let items = createItems(count: 10)
        
        XCTContext.runActivity(named: "Current index is 0") { _ in
            let control = ListDisplayControl(currentIndex: 0, items: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "0")
            XCTAssertEqual(control.displayItems[5].name, "5")
        }
        
        XCTContext.runActivity(named: "Current index is 3") { _ in
            let control = ListDisplayControl(currentIndex: 3, items: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "3")
            XCTAssertEqual(control.displayItems[5].name, "8")
        }
        
        XCTContext.runActivity(named: "Current index is 4") { _ in
            let control = ListDisplayControl(currentIndex: 4, items: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "4")
            XCTAssertEqual(control.displayItems[5].name, "9")
        }
        
        XCTContext.runActivity(named: "Current index is 5") { _ in
            let control = ListDisplayControl(currentIndex: 5, items: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "4")
            XCTAssertEqual(control.displayItems[5].name, "9")
        }
        
        XCTContext.runActivity(named: "Current index is 6") { _ in
            let control = ListDisplayControl(currentIndex: 6, items: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "4")
            XCTAssertEqual(control.displayItems[5].name, "9")
        }
        
        XCTContext.runActivity(named: "Current index is at the end") { _ in
            let control = ListDisplayControl(currentIndex: items.count - 1, items: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "4")
            XCTAssertEqual(control.displayItems[5].name, "9")
        }
    }
    
    func testIsDisableScrollUpButton() {
        
        XCTContext.runActivity(named: "Items count is less than display limit") { _ in
            let items = createItems(count: WidgetConfig.displayTodoItemLimitCount - 1)
            let control = ListDisplayControl(currentIndex: 0, items: items)
            XCTAssertTrue(control.isDisableScrollUpButton)
        }
        
        XCTContext.runActivity(named: "Items count is equal to display limit") { _ in
            let items = createItems(count: WidgetConfig.displayTodoItemLimitCount)
            let control = ListDisplayControl(currentIndex: 0, items: items)
            XCTAssertTrue(control.isDisableScrollUpButton)
        }
        
        XCTContext.runActivity(named: "Items count is greater than display limit and current index is 0") { _ in
            let items = createItems(count: WidgetConfig.displayTodoItemLimitCount + 1)
            let control = ListDisplayControl(currentIndex: 0, items: items)
            XCTAssertTrue(control.isDisableScrollUpButton)
        }
        
        XCTContext.runActivity(named: "Items count is greater than display limit and current index is 8") { _ in
            let items = createItems(count: WidgetConfig.displayTodoItemLimitCount + 8)
            let control = ListDisplayControl(currentIndex: 8, items: items)
            XCTAssertFalse(control.isDisableScrollUpButton)
        }
    }
    
    func test_isDisableScrollDownButton() {
        
        XCTContext.runActivity(named: "Items count is less than display limit") { _ in
            let items = createItems(count: WidgetConfig.displayTodoItemLimitCount - 1)
            let control = ListDisplayControl(currentIndex: 0, items: items)
            XCTAssertTrue(control.isDisableScrollDownButton)
        }
        
        XCTContext.runActivity(named: "Items count is equal to display limit") { _ in
            let items = createItems(count: WidgetConfig.displayTodoItemLimitCount)
            let control = ListDisplayControl(currentIndex: 0, items: items)
            XCTAssertTrue(control.isDisableScrollDownButton)
        }
        
        XCTContext.runActivity(named: "Items count is greater than display limit and current index is at the end") { _ in
            let items = createItems(count: WidgetConfig.displayTodoItemLimitCount + 1)
            let control = ListDisplayControl(currentIndex: items.count - 1, items: items)
            XCTAssertTrue(control.isDisableScrollDownButton)
        }
        
        XCTContext.runActivity(named: "Items count is greater than display limit and current index is not at the end") { _ in
            let items = createItems(count: WidgetConfig.displayTodoItemLimitCount + 20)
            let control = ListDisplayControl(currentIndex: 10, items: items)
            XCTAssertFalse(control.isDisableScrollDownButton)
        }
    }
}

extension ListControlTests {
    
    private func createItems(count: Int) -> [TodoItem] {
        var items: [TodoItem] = []
        for i in 0..<count {
            let newItem = TodoItem(name: "\(i)", createDate: Date())
            items.append(newItem)
        }
        return items
    }
}
