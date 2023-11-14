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
        
        WidgetBackgroundView(needsBottomSpacer: false) {
            
            VStack(spacing: 0) {
                
                HStack {
                    CloseButton(type: type)
                        .frame(width: WidgetConfig.topBarHeight,
                               height: WidgetConfig.topBarHeight)
                    
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
                    .stroke(style: .init(lineWidth: 1))
                    .foregroundStyle(.gray)
                    .frame(height: 1)
                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                
                Spacer()
                
                InputForm(text: WidgetTodoCore.shared.inputText)
                
                Spacer().frame(height: 8)
                
                WidgetKeyboard(type: type)
            }
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

