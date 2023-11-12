//
//  EditTodoItemType.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

enum EditTodoItemType {
    case addNewTodoItem
    case editTodoItem(id: UUID)
    
    var displayLabel: LocalizedStringKey {
        switch self {
        case .addNewTodoItem:
            return "New"
        case .editTodoItem:
            return "Edit"
        }
    }
    
    var closeButtonImageName: String {
        switch self {
        case .addNewTodoItem:
            return "xmark"
        case .editTodoItem:
            return "chevron.left"
        }
    }
}
