//
//  KeyboardLetterKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct KeyboardLetterKey: View {
    
    init(_ letter: String, isCapsLocked: Bool) {
        if isCapsLocked {
            self.letter = letter.uppercased()
        } else {
            self.letter = letter.lowercased()
        }
    }
    
    private let letter: String
    
    var body: some View {
        
        Button(intent: KeyboardLetterKeyIntent(letter: letter)) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyWhite)
            }
            .overlay {
                Text(letter)
                    .foregroundStyle(Color.label)
                    .font(.system(size: 20))
            }
        }
    }
}

struct KeyboardLetterKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Keyboard letter key"
    
    @Parameter(title: "Keyboard letter key")
    var letter: String
    
    init() {}
    
    init(letter: String) {
        self.letter = letter
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapCharacterKey(letter)
        return .result()
    }
}


#Preview {
    Color.gray
        .overlay {
            HStack {
                KeyboardLetterKey("A", isCapsLocked: true)
                KeyboardLetterKey("A", isCapsLocked: false)
            }
        }
}
