//
//  SpaceKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct SpaceKey: View {
            
    var body: some View {
        
        Button(intent: SpaceKeyIntent()) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .frame(width: 154, height: 34)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyWhite)
                    .frame(width: 154, height: 34)
            }
            .overlay {
                Text("space")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.label)
            }
        }
    }
}

#Preview {
    Color.keyboardBackground
        .overlay {
            SpaceKey()
        }
}

struct SpaceKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Space key"
    
    @Parameter(title: "Space key")
    var id: String
    
    init() {
        id = "spaceKey"
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Do something
        print(id)
        return .result()
    }
}