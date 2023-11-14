//
//  TodoItemListView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct TodoItemListView: View {
    
    @Environment(\.widgetContentMargins) var margins
    @Environment(\.widgetTodoCore) var core
    let items: [TodoItem]
    
    private var listDisplayControl: ListDisplayControl {
        return core.makeListDisplayControl(for: items)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                HStack(spacing: 0) {
                    
                    HStack(alignment: .bottom, spacing: 4) {
                        Text(String(items.count))
                            .contentTransition(.numericText())
                            .font(.system(size: 30))
                            .bold()
                        Text("tasks")
                            .font(.system(size: 13))
                            .fontWeight(.semibold)
                            .offset(y: -4)
                    }
                    .foregroundStyle(Color.label)
                    .padding(.leading, margins.leading)
                    
                    Spacer()

                    if listDisplayControl.canAppearScrollButtons {
                        
                        Group {
                            ListScrollButton(direction: .up,
                                             isDisabled: listDisplayControl.isDisableScrollUpButton)
                                .frame(width: 44,  height: 40)
                            ListScrollButton(direction: .down,
                                             isDisabled: listDisplayControl.isDisableScrollDownButton)
                                .frame(width: 44,  height: 40)
                        }
                    }
                    
                }
                .frame(height: WidgetConfig.topBarHeight)
                
                Line()
                    .stroke(style: .init(lineWidth: 1))
                    .foregroundStyle(.gray)
                    .frame(height: 1)
                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                
                ForEach(listDisplayControl.displayItems) {
                    TodoItemListRow(item: $0)
                }
                .id("TodoItemListRows")
                .transition(core.listScrollTransition)
                .padding(.trailing, margins.trailing)
                .padding(.leading, margins.leading)
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    PresentAddItemViewButton(type: .floatingAction)
                    .frame(width: 44, height: 44)
                }
            }
            .padding(.trailing, margins.trailing)
            .padding(.bottom, 4)
        }
    }
}

// MARK: - Preview
#if DEBUG
import WidgetKit

struct TodoItemListPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            WidgetBackgroundView {
                TodoItemListView(items: [])
            }
                .modelContainer(SwiftDataStore.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    TodoItemListPreviewWidget()
} timeline: {
    WidgetTodoEntry(date: .now)
}
#endif
