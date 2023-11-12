//
//  ListDisplayControl.swift
//  UltimateWidgetTodo
//
//

import Foundation

struct ListDisplayControl {
    
    init(currentIndex: Int, items: [TodoItem]) {
        self.currentIndex = currentIndex
        self.items = items
    }
    
    private let currentIndex: Int
    private let items: [TodoItem]
    private let displayLimitCount = WidgetConfig.displayTodoItemLimitCount
    
    var canAppearScrollButtons: Bool {
        return items.count > displayLimitCount
    }
    
    var displayItems: [TodoItem] {
        if items.count <= displayLimitCount {
            return items
        }
        
        let endIndex = min(currentIndex + displayLimitCount, items.count)
        let startIndex = min(currentIndex, endIndex - displayLimitCount)
        let displayItems = Array(items[startIndex..<endIndex])
        
        return displayItems
    }
    
    var isDisableScrollUpButton: Bool {
        if items.count > displayLimitCount,
           currentIndex > 0 {
            return false
        }
        return true
        
    }
    
    var isDisableScrollDownButton: Bool {
        if items.count <= displayLimitCount {
            return true
        }
        return items.count <= currentIndex + displayLimitCount
    }
}

