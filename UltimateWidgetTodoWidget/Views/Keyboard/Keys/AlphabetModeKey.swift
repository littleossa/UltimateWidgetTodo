//
//  AlphabetModeKey.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct AlphabetModeKey: View {
            
    var body: some View {
        
        Button(intent: AlphabetModeKeyIntent()) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyDarkGray)
            }
            .overlay {
                Image(systemName: "abc")
                    .font(.system(size: 12))
                    .foregroundStyle(Color.label)
            }
        }
    }
}

#Preview {
    Color.keyboardBackground
        .overlay {
            AlphabetModeKey()
        }
}


struct AlphabetModeKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Alphabet Mode key"
    
    @Parameter(title: "Alphabet Mode key")
    var id: String
    
    init() {
        id = "alphabetModekey"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapAlphabetModeKey()
        return .result()
    }
}
