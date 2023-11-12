//
//  WidgetError.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

enum WidgetError: String, Error {
    case unknown
    case todoItemDeletionFailure
    case todoItemEditingFailure
    case todoItemFetchingFailure
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
        case .todoItemDeletionFailure:
            return .init(code: 1,
                         title: "Unable to delete the TODO item",
                         message: "An error occurred while deleting the item.")
        case .todoItemEditingFailure:
            return .init(code: 2,
                         title: "Unable to edit the TODO item",
                         message: "An error occurred while editing the item.")
        case .todoItemFetchingFailure:
            return .init(code: 3,
                         title: "Failed to Fetch TODO Items",
                         message: "An error occurred while fetching TODO items.")
        case .todoItemNameLimitExceeded:
            return .init(code: 4,
                         title: "TODO Item Name Limit Exceeded",
                         message: "The item name exceeds the allowed character limit of \(WidgetConfig.todoItemNameLimitCount) characters. Please shorten this.")
        }
    }
}

