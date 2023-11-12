////
////  ListDisplayRepository.swift
////  UltimateWidgetTodoWidgetExtension
////
////

import Foundation

class ListDisplayRepository {
    
    init(store: UserDefaultsStore = .shared) {
        self.store = store
    }
    
    private let store: UserDefaultsStore
    private var currentIndex: Int {
        return store.listDisplayIndex
    }
    
    func makeListDisplayControl(for items: [TodoItem]) -> ListDisplayControl {
        return ListDisplayControl(currentIndex: currentIndex,
                                  items: items)
    }
    
    func scrollDownList() {
        store.listDisplayIndex += 1
    }
    
    func scrollUpList() {
        guard store.listDisplayIndex > 0
        else { return }
        store.listDisplayIndex -= 1
    }
    
    func updateIndex(to index: Int) {
        store.listDisplayIndex = index
    }
}


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
