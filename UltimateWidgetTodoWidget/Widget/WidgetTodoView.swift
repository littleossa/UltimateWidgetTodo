//
//  WidgetTodoView.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

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
        .modelContainer(core.swiftDataContainer)
    }
}

#Preview {
    WidgetTodoView()
}
