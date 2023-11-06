//
//  MorePunctuationMarksKey.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct MorePunctuationMarksKey: View {
            
    var body: some View {
        
        Button(intent: MorePunctuationMarksKeyIntent()) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyDarkGray)
            }
            .overlay {
                Text("#+-")
                    .font(.system(size: 13))
                    .foregroundStyle(Color.label)
            }
        }
    }
}

#Preview {
    Color.keyboardBackground
        .overlay {
            MorePunctuationMarksKey()
        }
}


struct MorePunctuationMarksKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "More punctuation marks key"
    
    @Parameter(title: "More punctuation marks key")
    var id: String
    
    init() {
        id = "morePunctuationMarksKey"
    }
    
    func perform() async throws -> some IntentResult {
        KeyboardInputManager.shared.deleteLastCharacter()
        return .result()
    }
}

