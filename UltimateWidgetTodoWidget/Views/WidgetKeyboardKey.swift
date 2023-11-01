//
//  WidgetKeyboardKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct KeyboardCharacterKey: View {
    
    init(_ character: String) {
        self.character = character
    }
    
    private let character: String
    
    var body: some View {
        
        Button(intent: KeyboardCharacterKeyIntent(character: character)) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color(uiColor: .darkGray))
                    .frame(width: 26, height: 34)
                    .offset(y: 2)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.white)
                    .frame(width: 26, height: 34)
            }
            .overlay {
                Text(character)
                    .foregroundStyle(Color(uiColor: .label))
                    .font(.system(size: 20))
            }
        }
    }
}

struct KeyboardCharacterKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Keyboard key"
    
    @Parameter(title: "Keyboard key")
    var id: String
    
    init() {}
    
    init(character: String) {
        self.id = character
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Do something
        print(id)
        return .result()
    }
}


#Preview {
    Color.gray
        .overlay {
            KeyboardCharacterKey("A")
        }
}
