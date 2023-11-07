//
//  ScreenType.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import Foundation

enum ScreenType: Equatable {
        
    case main
    case addTask
    case editTask(id: UUID)
    
    var screenName: String {
        switch self {
        case .main:
            return "main"
        case .addTask:
            return "addTask"
        case .editTask:
            return "editTask"
        }
    }
}
