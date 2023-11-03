//
//  KeyboardCharacterKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct KeyboardCharacterKey: View {
    
    init(_ character: String, isCapsLocked: Bool) {
        if isCapsLocked {
            self.character = character.uppercased()
        } else {
            self.character = character.lowercased()
        }
    }
    
    private let character: String
    
    var body: some View {
        
        Button(intent: KeyboardCharacterKeyIntent(character: character)) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .frame(width: 26, height: 34)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyWhite)
                    .frame(width: 26, height: 34)
            }
            .overlay {
                Text(character)
                    .foregroundStyle(Color.label)
                    .font(.system(size: 20))
            }
        }
    }
}

struct KeyboardCharacterKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Keyboard key"
    
    @Parameter(title: "Keyboard key")
    var character: String
    
    init() {}
    
    init(character: String) {
        self.character = character
    }
    
    func perform() async throws -> some IntentResult {
        KeyboardInputManager.shared.input(character)
        return .result()
    }
}


#Preview {
    Color.gray
        .overlay {
            HStack {
                KeyboardCharacterKey("A", isCapsLocked: true)
                KeyboardCharacterKey("A", isCapsLocked: false)
            }
        }
}
