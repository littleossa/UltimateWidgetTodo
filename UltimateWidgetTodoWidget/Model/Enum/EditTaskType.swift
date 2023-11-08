//
//  EditTaskType.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

enum EditTaskType {
    case addNewTask
    case editTask(id: UUID)
    
    var displayLabel: LocalizedStringKey {
        switch self {
        case .addNewTask:
            return "New"
        case .editTask:
            return "Edit"
        }
    }
    
    var closeButtonImageName: String {
        switch self {
        case .addNewTask:
            return "xmark"
        case .editTask:
            return "chevron.left"
        }
    }
}
