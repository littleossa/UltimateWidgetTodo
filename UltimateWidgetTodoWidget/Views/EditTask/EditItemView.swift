//
//  EditItemView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct EditItemView: View {
    
    @Environment(\.widgetTodoCore) var core
    
    let type: EditTodoItemType
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: WidgetConfig.colorHeaderHeight - 16)
            
            HStack {
                CloseButton(type: type)
                    .frame(width: WidgetConfig.topBarHeight,
                           height: WidgetConfig.topBarHeight)
                    .offset(x: -8)
                
                Spacer()
                
                Text(type.displayLabel)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundStyle(Color.label)
                
                Spacer()
                
                Spacer()
                    .frame(width: WidgetConfig.topBarHeight,
                           height: WidgetConfig.topBarHeight)
            }
            .frame(height: WidgetConfig.topBarHeight)
            
            Line()
                .stroke(style: .init(lineWidth: 2))
                .foregroundStyle(.gray)
                .frame(height: 2)
                .padding(.bottom, 4)
            
            Spacer()
            
            InputForm(text: WidgetTodoCore.shared.inputText)
                        
            Spacer().frame(height: core.isEmojiMode ? 14 : 26)
                        
            WidgetKeyboard(type: type)
        }
        .containerBackground(for: .widget) {
            KeyboardOverlayBackgroundView()
        }
    }
}

// MARK: - Preview
#if DEBUG
struct EditItemPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            EditItemView(type: .addNewTodoItem)
                .modelContainer(SwiftDataStore.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    EditItemPreviewWidget()
} timeline: {
    WidgetTodoEntry(date: .now)
}
#endif
