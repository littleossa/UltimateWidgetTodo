//
//  BackspaceKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct BackspaceKey: View {
    
    init(hasKeyShape: Bool = true) {
        self.hasKeyShape = hasKeyShape
    }
    
    let hasKeyShape: Bool
            
    var body: some View {
        
        Button(intent: BackspaceKeyIntent()) {
            
            ZStack {
                
                if hasKeyShape {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.keyShadow)
                        .offset(y: 1)
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.keyDarkGray)
                }
                
                Image(systemName: "delete.backward")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.label)
            }
        }
    }
}

#Preview {
    Color.keyboardBackground
        .overlay {
            BackspaceKey()
        }
}


struct BackspaceKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Backspace key"
    
    @Parameter(title: "Backspace Key")
    var id: String
    
    init() {
        id = "backspaceKey"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapBackspaceKey()
        return .result()
    }
}
