//
//  WidgetTodoProvider.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import WidgetKit

struct WidgetTodoProvider: TimelineProvider {
    func placeholder(in context: Context) -> TodoItemEntry {
        TodoItemEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (TodoItemEntry) -> ()) {
        let entry = TodoItemEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<TodoItemEntry>) -> ()) {
        
        // Entries are not used but it must be set for rendering the widget
        let entries: [TodoItemEntry] = [TodoItemEntry(date: Date(), emoji: "😀")]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
