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
                    .transition(core.listPresentingTransition)
            case .addTask:
                EditTaskView(type: .addNewTask)
                    .transition(.push(from: .bottom))
            case let .editTask(id):
                EditTaskView(type: .editTask(id: id))
                    .transition(.push(from: .leading))
            }
        }
        .modelContainer(core.swiftDataContainer)
    }
}

#Preview {
    WidgetTodoView()
}

struct WidgetTodoErrorView<Content: View>: View {
    
    init(error: WidgetError, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.error = error
    }
    
    let content: Content
    let error: WidgetError
    
    var body: some View {
        
        ZStack {
            content
            
            Color.black
            
            Rectangle()
                .fill(.gray)
            
            VStack {
                Text(error.info.title)
                Text(error.info.message)
            }
        }
    }
}

extension View {
    
    @ViewBuilder
    func alert(widgetError: WidgetError?) -> some View {
        if let widgetError {
            WidgetTodoErrorView(error: widgetError) {
                self
            }
        } else {
            self
        }
    }
}
