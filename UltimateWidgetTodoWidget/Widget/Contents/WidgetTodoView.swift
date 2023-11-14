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
        
        ZStack {
            switch core.currentScreen {
            case .main:
                MainView()
                    .transition(.opacity)
            case .addTodoItem:
                AddItemView()
                    .transition(.asymmetric(insertion: .push(from: .top),
                                            removal: .push(from: .top)))
                    .background {
                        MainView()
                    }

            case let .editTodoItem(id):
                EditItemView(type: .editTodoItem(id: id))
                    .transition(.asymmetric(insertion: .push(from: .trailing),
                                            removal: .push(from: .trailing)))
            }
        }
        .alert(widgetError: core.error)
        .modelContainer(core.swiftDataContainer)
    }
}

#Preview {
    WidgetTodoView()
}
