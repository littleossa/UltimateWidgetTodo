//
//  WidgetTodoProvider.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import WidgetKit

struct WidgetTodoProvider: TimelineProvider {
    func placeholder(in context: Context) -> TaskEntry {
        TaskEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (TaskEntry) -> ()) {
        let entry = TaskEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<TaskEntry>) -> ()) {
        
        // Entries are not used but it must be set for rendering the widget
        let entries: [TaskEntry] = [TaskEntry(date: .now)]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
