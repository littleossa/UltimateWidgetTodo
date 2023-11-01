//
//  WidgetKeyboardKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct WidgetKeyboardKey: View {
    
    let character: String
    
    var body: some View {
        
        Button(intent: WidgetKeyboardKeyIntent(character: character)) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(uiColor: .darkGray))
                    .frame(width: 50, height: 64)
                    .offset(y: 2)
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
                    .frame(width: 50, height: 64)
            }
            .overlay {
                Text(character)
                    .foregroundStyle(Color(uiColor: .label))
                    .font(.system(size: 32))
            }
        }
    }
}

struct WidgetKeyboardKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Keyboard key"
    
    @Parameter(title: "Keyboard key")
    var id: String
    
    init() {}
    
    init(character: String) {
        self.id = character
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Do something
        return .result()
    }
}


#Preview {
    Color.gray
        .overlay {
            WidgetKeyboardKey(character: "A")
        }
}
