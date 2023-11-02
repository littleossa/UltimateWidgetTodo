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
                    .fill(Color(uiColor: .darkGray))
                    .frame(width: 36, height: 34)
                    .offset(y: 2)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.white)
                    .frame(width: 36, height: 34)
            }
            .overlay {
                
                ZStack {
                    Image(systemName: "arrowshape.left.fill")
                        .resizable()
                        .frame(width: 24)
                        .rotationEffect(.degrees(90))
                        .scaleEffect(0.6)
                }
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