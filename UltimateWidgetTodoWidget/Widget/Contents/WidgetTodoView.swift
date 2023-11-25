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
            case .main, .addTodoItem:
                
                ZStack {
                    MainView()
                        .transition(.opacity)
                    
                    if core.currentScreen == .addTodoItem {
                        
                        Color.black.opacity(0.7)
                            .contentTransition(.opacity)
                        
                        AddItemView()
                            .frame(height: core.currentScreen == .addTodoItem ? nil : 0)
                            .transition(.asymmetric(insertion: .push(from: .top),
                                                    removal: .push(from: .top)))
                    }
                }

            case let .editTodoItem(id):
                EditItemView(type: .editTodoItem(id: id))
                    .transition(.asymmetric(insertion: .push(from: .leading),
                                            removal: .push(from: .leading)))
            }
        }
        .alert(widgetError: core.error)
        .modelContainer(core.swiftDataContainer)
    }
}

#Preview {
    WidgetTodoView()
}
