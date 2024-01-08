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
        
        var entries: [WidgetTodoEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = WidgetTodoEntry(date: entryDate)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
