//
//  WidgetError.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

enum WidgetError: String, Error {
    case unknown
    case todoItemEditingFailure
    case todoItemDeletionFailure
    case todoItemNameLimitExceeded
    
    struct Info {
        let code: Int
        let title: LocalizedStringKey
        let message: LocalizedStringKey
    }
    
    var info: Info {
        switch self {
        case .unknown:
            return .init(code: 0,
                         title: "Unknown Error",
                         message: "An unknown error occurred.")
        case .todoItemEditingFailure:
            return .init(code: 1,
                         title: "Unable to edit the TODO item",
                         message: "An error occurred while editing the item.")
        case .todoItemDeletionFailure:
            return .init(code: 2,
                         title: "Unable to delete the TODO item",
                         message: "An error occurred while deleting the item.")
        case .todoItemNameLimitExceeded:
            return .init(code: 3,
                         title: "TODO Item Name Limit Exceeded",
                         message: "The item name exceeds the allowed character limit of \(WidgetConfig.todoItemNameLimitCount) characters. Please shorten this.")
        }
    }
}

