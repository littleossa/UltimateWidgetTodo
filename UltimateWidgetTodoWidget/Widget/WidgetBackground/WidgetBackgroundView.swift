//
//  WidgetBackgroundView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct WidgetBackgroundView: View {
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(LinearGradient.ultimateBlue)
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
            MainView()
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
    WidgetTodoEntry(date: .now)
}
#endif
