//
//  CapsLockKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct CapsLockKey: View {
            
    init(isCapsLocked: Bool) {
        self.isCapsLocked = isCapsLocked
    }
    
    let isCapsLocked: Bool
        
    var body: some View {
        
        Button(intent: CapsLockKeyIntent()) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(isCapsLocked ? .staticKeyWhite : .keyDarkGray)
            }
            .overlay {
                Image(systemName: isCapsLocked ? "arrowshape.left.fill": "arrowshape.left")
                    .resizable()
                    .frame(width: 24)
                    .rotationEffect(.degrees(90))
                    .scaleEffect(0.6)
                    .foregroundStyle(isCapsLocked ? .black : Color.label)
            }
        }
    }
}

#Preview {
    Color.gray
        .overlay {
            HStack {
                CapsLockKey(isCapsLocked: true)
                CapsLockKey(isCapsLocked: false)
            }
        }
}

struct CapsLockKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Caps lock key"
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapCapsLockKey()
        return .result()
    }
}
