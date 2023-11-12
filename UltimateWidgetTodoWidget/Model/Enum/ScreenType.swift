//
//  ScreenType.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import Foundation

enum ScreenType: Equatable {
        
    case main
    case addTodoItem
    case editTodoItem(id: UUID)
    
    var screenName: String {
        switch self {
        case .main:
            return "main"
        case .addTodoItem:
            return "addTodoItem"
        case .editTodoItem:
            return "editTodoItem"
        }
    }
}
