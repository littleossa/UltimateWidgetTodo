//
//  CapsLockKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct CapsLockKey: View {
    
    var isCapsLocked: Bool
        
    var body: some View {
        
        Button(intent: CapsLockKeyIntent(isCapsLocked: isCapsLocked)) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .frame(width: 36, height: 34)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(isCapsLocked ? .staticKeyWhite : .keyDarkGray)
                    .frame(width: 36, height: 34)
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
    
    @Parameter(title: "isCapsLocked")
    var isCapsLocked: Bool
    
    init() {}
    
    init(isCapsLocked: Bool) {
        self.isCapsLocked = isCapsLocked
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Do something
        print(isCapsLocked)
        return .result()
    }
}
