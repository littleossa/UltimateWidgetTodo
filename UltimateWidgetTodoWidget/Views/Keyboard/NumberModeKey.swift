//
//  NumberModeKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct NumberModeKey: View {
            
    var body: some View {
        
        Button(intent: NumberModeIntent()) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .frame(width: 36, height: 34)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyDarkGray)
                    .frame(width: 36, height: 34)
            }
            .overlay {
                
                ZStack {
                    Image(systemName: "textformat.123")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.label)
                }
            }
        }
    }
}

#Preview {
    Color.keyboardBackground
        .overlay {
            NumberModeKey()
        }
}


struct NumberModeIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Number Mode key"
    
    @Parameter(title: "Number Mode key")
    var id: String
    
    init() {
        id = "numberModekey"
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Do something
        print(id)
        return .result()
    }
}
