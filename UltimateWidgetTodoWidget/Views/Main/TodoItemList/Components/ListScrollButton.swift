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
    let isDisabled: Bool
    
    private var scrollButtonIntent: any AppIntent {
        if isDisabled {
            return ListScrollDisabledButtonIntent()
        }
        return direction == .down ? ListScrollDownButtonIntent() : ListScrollUpButtonIntent()
    }
        
    var body: some View {
        
        Button(intent: scrollButtonIntent) {
            Image(systemName: direction == .down ? "chevron.down" : "chevron.up")
                .font(.system(size: 22))
                .foregroundStyle(isDisabled ? .gray: .blue)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack {
        ListScrollButton(direction: .up,
                         isDisabled: true)
        ListScrollButton(direction: .up,
                         isDisabled: false)
        ListScrollButton(direction: .down,
                         isDisabled: true)
        ListScrollButton(direction: .down,
                         isDisabled: false)
    }
}

struct ListScrollDownButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "List Scroll Down Button"
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapScrollDownList()
        return .result()
    }
}

struct ListScrollUpButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "List Scroll Up Button"
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapScrollUpList()
        return .result()
    }
}

struct ListScrollDisabledButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "List Scroll Disable Button"
    
    func perform() async throws -> some IntentResult {
        print("This does not work")
        WidgetTodoCore.shared.onTapDisabledScroll()
        return .result()
    }
}

