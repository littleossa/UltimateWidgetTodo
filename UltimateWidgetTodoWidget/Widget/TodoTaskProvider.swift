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
        
        // Entries is empty because TimeLine does not use
        let entries: [TodoItemEntry] = []
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

