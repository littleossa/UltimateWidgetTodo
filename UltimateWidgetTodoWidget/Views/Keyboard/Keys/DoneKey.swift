//
//  DoneKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct DoneKey: View {
    
    let inputText: String
            
    var body: some View {
        
        Button(intent: DoneKeyIntent()) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(inputText.isEmpty ? .keyDarkGray : .blue)
            }
            .overlay {
                Text("done")
                    .font(.system(size: 14))
                    .bold()
                    .foregroundStyle(inputText.isEmpty ? .gray : .white)
            }
        }
    }
}

#Preview {
    Color.keyboardBackground
        .overlay {
            HStack {
                DoneKey(inputText: "")
                DoneKey(inputText: "a")
            }
        }
}


struct DoneKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Done key"
    
    @Parameter(title: "Done Key")
    var id: String
    
    init() {
        id = "doneKey"
    }
    
    func perform() async throws -> some IntentResult {
        let name = KeyboardInputManager.shared.inputText
        await SwiftDataStore.shared.addTask(name: name)
        KeyboardInputManager.shared.clearInputText()
        ScreenManager.shared.changeScreen(into: .main)
        
        return .result()
    }
}
