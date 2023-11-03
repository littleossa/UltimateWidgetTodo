//
//  AddTodoItemView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct AddTodoItemView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: WidgetConfig.topBarHeight - 16)
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 28))
                })
                .foregroundStyle(.blue)
                .frame(width: 40, height: 40)
                .buttonStyle(.plain)
                .offset(x: -8)
                
                Spacer()
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 6)
                .stroke(lineWidth: 1)
                .foregroundStyle(.keyboardBackground)
                .frame(width: 280, height: 40)
                .overlay {
                    
                    HStack {
                        Text("Add your task here..")
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.placeholder)
                            .padding(8)
                        
                        Spacer().frame(minWidth: 8)
                    }
                    .frame(width: 280)
                }
                        
            Spacer().frame(height: 28)
                        
            WidgetKeyboard()
        }
        .containerBackground(for: .widget) {
            KeyboardOverlayBackgroundView()
        }
    }
}

// MARK: - Preview
#if DEBUG
struct AddTodoItemPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            AddTodoItemView()
                .modelContainer(AppModelContainer.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    AddTodoItemPreviewWidget()
} timeline: {
    TodoItemEntry(date: .now, emoji: "😀")
}
#endif
