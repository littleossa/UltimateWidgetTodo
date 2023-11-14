//
//  WidgetBackgroundView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct WidgetBackgroundView<Content: View>: View {
    
    init(needsBottomSpacer: Bool = true, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.needsBottomSpacer = needsBottomSpacer
    }
    
    let content: Content
    let needsBottomSpacer: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(LinearGradient.ultimateBlue)
                .frame(height: WidgetConfig.colorHeaderHeight)
            
            content
            
            if needsBottomSpacer {
                Spacer()
            }
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
            WidgetBackgroundView {
                MainView()
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
