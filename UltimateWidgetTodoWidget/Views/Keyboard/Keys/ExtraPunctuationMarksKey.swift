//
//  ExtraPunctuationMarksKey.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct ExtraPunctuationMarksKey: View {
            
    var body: some View {
        
        Button(intent: ExtraPunctuationMarksKeyIntent()) {
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
            ExtraPunctuationMarksKey()
        }
}


struct ExtraPunctuationMarksKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "More punctuation marks key"
    
    @Parameter(title: "More punctuation marks key")
    var id: String
    
    init() {
        id = "morePunctuationMarksKey"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapExtraPunctuationMarksKey()
        return .result()
    }
}

