//
//  ListScrollButton.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct ListScrollButton: View {
    
    enum Direction {
        case down
        case up
    }
    
    let direction: Direction
    
    private var scrollButtonIntent: any AppIntent {
        return direction == .down ? ListScrollDownButtonIntent() : ListScrollUpButtonIntent()
    }
        
    var body: some View {
        
        Button(intent: scrollButtonIntent) {
            Image(systemName: direction == .down ? "chevron.down" : "chevron.up")
                .font(.system(size: 22))
                .foregroundStyle(.blue)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack {
        ListScrollButton(direction: .up)
        ListScrollButton(direction: .down)
    }
}

struct ListScrollDownButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "List Scroll Down Button"
    
    @Parameter(title: "List Scroll Down Button")
    var id: String
    
    init() {
        self.id = "listScrollDown"
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Scroll Down
        return .result()
    }
}

struct ListScrollUpButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "List Scroll Up Button"
    
    @Parameter(title: "List Scroll Up Button")
    var id: String
    
    init() {
        self.id = "listScrollUp"
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Scroll Up
        return .result()
    }
}
