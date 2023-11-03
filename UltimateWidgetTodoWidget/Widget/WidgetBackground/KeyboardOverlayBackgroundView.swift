//
//  KeyboardOverlayBackgroundView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct KeyboardOverlayBackgroundView: View {
    
    let topBarColor = LinearGradient(colors: [.indigo, .blue, .cyan, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(topBarColor)
                .frame(height: WidgetConfig.topBarHeight)
            
            Spacer().frame(height: 40)
            
            Divider()
            
            Spacer()
            
            Rectangle()
                .fill(.keyboardBackground)
                .frame(height: WidgetConfig.keyboardHeight)
        }
        .background(.widgetBackground)
    }
}

// MARK: - Preview
#if DEBUG
import WidgetKit

struct KeyboardOverlayBackgroundPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            AddTodoItemView()
                .containerBackground(for: .widget) {
                    KeyboardOverlayBackgroundView()
                }
                .modelContainer(AppModelContainer.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    KeyboardOverlayBackgroundPreviewWidget()
} timeline: {
    TodoItemEntry(date: .now, emoji: "😀")
}
#endif