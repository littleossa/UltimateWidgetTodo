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
    
    var currentIndex: Int {
        return store.listDisplayIndex
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
