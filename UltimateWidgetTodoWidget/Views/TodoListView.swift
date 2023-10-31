//
//  TodoListView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftData
import SwiftUI
import WidgetKit

struct TodoListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query (sort: \TodoItem.createDate, order: .forward)
    private var items: [TodoItem]

    var body: some View {
        VStack {
            ForEach(items) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    TodoListView()
        .modelContainer(
            AppModelContainer.testStore.makePreviewContainer(itemCount: 1)
        )
        .previewContext(WidgetPreviewContext(family: .systemLarge))
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.yellow)
        }
}
