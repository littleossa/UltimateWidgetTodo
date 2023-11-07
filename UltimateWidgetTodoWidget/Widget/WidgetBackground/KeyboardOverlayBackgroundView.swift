//
//  KeyboardOverlayBackgroundView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct KeyboardOverlayBackgroundView: View {
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(LinearGradient.ultimateBlue)
                .frame(height: WidgetConfig.colorHeaderHeight)
            
            Spacer().frame(height: WidgetConfig.topBarHeight)
                        
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
            EditTaskView(type: .addNewTask)
                .containerBackground(for: .widget) {
                    KeyboardOverlayBackgroundView()
                }
                .modelContainer(SwiftDataStore.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    KeyboardOverlayBackgroundPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
#endif
