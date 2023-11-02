//
//  DeleteKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct DeleteKey: View {
            
    var body: some View {
        
        Button(intent: DeleteKeyIntent()) {
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
            DeleteKey()
        }
}


struct DeleteKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Delete key"
    
    @Parameter(title: "Delete Key")
    var id: String
    
    init() {
        id = "deleteKey"
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Do something
        print(id)
        return .result()
    }
}
