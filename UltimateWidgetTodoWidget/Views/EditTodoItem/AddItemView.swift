//
//  AddItemView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct AddItemView: View {
    
    @Environment(\.widgetTodoCore) var core
    
    var body: some View {
        VStack(spacing: 0) {
            
            Rectangle()
                .fill(.black.opacity(0.001))
                .frame(height: WidgetConfig.colorHeaderHeight + 16)
            
            Color.widgetBackground
                .overlay {
                    VStack(spacing: 0) {
                        
                        HStack {
                            CloseButton(type: .addNewTodoItem)
                                .frame(width: WidgetConfig.topBarHeight,
                                       height: WidgetConfig.topBarHeight)
                            
                            Spacer()
                            
                            Text(EditTodoItemType.addNewTodoItem.displayLabel)
                                .font(.system(size: 20))
                                .bold()
                                .foregroundStyle(Color.label)
                            
                            Spacer()
                            
                            Spacer()
                                .frame(width: WidgetConfig.topBarHeight,
                                       height: WidgetConfig.topBarHeight)
                        }
                        .frame(height: WidgetConfig.topBarHeight)
                        
                        Spacer()
                        
                        InputForm(text: WidgetTodoCore.shared.inputText)
                        
                        Spacer().frame(height: 8)
                        WidgetKeyboard(type: .addNewTodoItem)
                    }
                    .background(.widgetBackground)
                }
                .padding(.top, 8)
                .clipShape(.rect(cornerRadius: 12, style: .circular))
                .contentTransition(.identity)
        }
        .background(.widgetBackground.opacity(0.001))
    }
}


// MARK: - Preview
#if DEBUG
struct AddItemPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            AddItemView()
                .containerBackground(for: .widget) {
                    Color.black
                }
        }
    }
}

#Preview(as: .systemLarge) {
    AddItemPreviewWidget()
} timeline: {
    WidgetTodoEntry(date: .now)
}
#endif

struct AddItemContentView: View {
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
