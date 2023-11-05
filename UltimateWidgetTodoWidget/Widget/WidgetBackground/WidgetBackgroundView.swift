//
//  WidgetBackgroundView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct WidgetBackgroundView: View {
    
    let topBarColor = LinearGradient(colors: [.indigo, .blue, .cyan, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(topBarColor)
                .frame(height: WidgetConfig.colorHeaderHeight)
            
            Spacer()
        }
        .background(.widgetBackground)
    }
}

// MARK: - Preview
#if DEBUG
import WidgetKit

struct WidgetBackgroundPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            TodoListView()
                .containerBackground(for: .widget) {
                    WidgetBackgroundView()
                }
                .modelContainer(SwiftDataStore.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    WidgetBackgroundPreviewWidget()
} timeline: {
    TodoItemEntry(date: .now, emoji: "😀")
}
#endif
