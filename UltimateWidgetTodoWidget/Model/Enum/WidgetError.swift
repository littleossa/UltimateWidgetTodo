//
//  WidgetError.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

enum WidgetError: String, Error {
    case unknown
    case taskEditingFailure
    case taskDeletionFailure
    case taskNameLimitExceeded
    
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
        case .taskEditingFailure:
            return .init(code: 1,
                         title: "Unable to edit the task",
                         message: "An error occurred while editing the task.")
        case .taskDeletionFailure:
            return .init(code: 2,
                         title: "Unable to delete the task",
                         message: "An error occurred while deleting the task.")
        case .taskNameLimitExceeded:
            return .init(code: 3,
                         title: "Task Name Limit Exceeded",
                         message: "The task name exceeds the allowed character limit of \(WidgetConfig.taskNameLimitCount) characters. Please shorten the task name.")
        }
    }
}

