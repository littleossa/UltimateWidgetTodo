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
    
    func makeListDisplayControl(for tasks: [Task]) -> ListDisplayControl {
        return ListDisplayControl(currentIndex: currentIndex,
                                  tasks: tasks)
    }
    
    func scrollDownList() {
        store.listDisplayIndex += 1
    }
    
    func scrollUpList() {
        guard store.listDisplayIndex > 0
        else { return }
        store.listDisplayIndex -= 1
    }
}


struct ListDisplayControl {
    
    init(currentIndex: Int, tasks: [Task]) {
        self.currentIndex = currentIndex
        self.tasks = tasks
    }
    
    private let currentIndex: Int
    private let tasks: [Task]
    private let displayLimitCount = WidgetConfig.displayTaskLimitCount
    
    var canAppearScrollButtons: Bool {
        return tasks.count > displayLimitCount
    }
    
    var displayTasks: [Task] {
        if tasks.count <= displayLimitCount {
            return tasks
        }
        
        let endIndex = min(currentIndex + displayLimitCount, tasks.count)
        let startIndex = min(currentIndex, endIndex - displayLimitCount)
        let displayTasks = Array(tasks[startIndex..<endIndex])
        
        return displayTasks
    }
    
    var isDisableScrollUpButton: Bool {
        if tasks.count > displayLimitCount,
           currentIndex > 0 {
            return false
        }
        return true
        
    }
    
    var isDisableScrollDownButton: Bool {
        if tasks.count <= displayLimitCount {
            return true
        }
        return tasks.count <= currentIndex + displayLimitCount
    }
}
