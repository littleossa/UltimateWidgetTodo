//
//  WidgetKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct WidgetKeyboard: View {
    var body: some View {
        VStack {
            HStack(spacing: 6) {
                KeyboardCharacterKey("Q")
                KeyboardCharacterKey("W")
                KeyboardCharacterKey("E")
                KeyboardCharacterKey("R")
                KeyboardCharacterKey("T")
                KeyboardCharacterKey("Y")
                KeyboardCharacterKey("U")
                KeyboardCharacterKey("I")
                KeyboardCharacterKey("O")
                KeyboardCharacterKey("P")
            }
            HStack(spacing: 6) {
                KeyboardCharacterKey("A")
                KeyboardCharacterKey("S")
                KeyboardCharacterKey("D")
                KeyboardCharacterKey("F")
                KeyboardCharacterKey("G")
                KeyboardCharacterKey("H")
                KeyboardCharacterKey("J")
                KeyboardCharacterKey("K")
                KeyboardCharacterKey("L")
            }
            
            HStack(spacing: 6) {
                KeyboardCharacterKey("Z")
                KeyboardCharacterKey("X")
                KeyboardCharacterKey("C")
                KeyboardCharacterKey("V")
                KeyboardCharacterKey("B")
                KeyboardCharacterKey("N")
                KeyboardCharacterKey("M")
            }
        }
        .background(.gray)
        .buttonStyle(.plain)
    }
}

#Preview(as: .systemLarge) {
    AddTodoItemPreviewWidget()
} timeline: {
    TodoItemEntry(date: .now, emoji: "😀")
}
