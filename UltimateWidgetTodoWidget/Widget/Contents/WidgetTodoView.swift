//
//  WidgetTodoView.swift
//  UltimateWidgetTodo
//
//

import SwiftUI
import WidgetKit

struct WidgetTodoView: View {
    
    @Environment(\.widgetTodoCore) var core
    
    var body: some View {
        
        Group {
            switch core.currentScreen {
            case .main:
                MainView()
            case .addTask:
                EditTaskView(type: .addNewTask)
            case let .editTask(id):
                EditTaskView(type: .editTask(id: id))
            }
        }
        .contentTransition(.opacity)
        .modelContainer(core.swiftDataContainer)
    }
}

#Preview {
    WidgetTodoView()
}
