//
//  WidgetTodoProvider.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import WidgetKit

struct WidgetTodoProvider: TimelineProvider {
    func placeholder(in context: Context) -> WidgetTodoEntry {
        WidgetTodoEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (WidgetTodoEntry) -> ()) {
        let entry = WidgetTodoEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetTodoEntry>) -> ()) {
        
        // Entries are not used but it must be set for rendering the widget
        let entries: [WidgetTodoEntry] = [WidgetTodoEntry(date: .now)]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
