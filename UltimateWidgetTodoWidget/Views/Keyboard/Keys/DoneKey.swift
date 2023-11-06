//
//  DoneKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct DoneKey: View {
    
    private var inputText: String {
        return KeyboardInputManager.shared.inputText
    }
            
    var body: some View {
        
        Button(intent: DoneKeyIntent(inputText: inputText)) {
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
                DoneKey()
                DoneKey()
            }
        }
}


struct DoneKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Done key"
    
    @Parameter(title: "Done Key")
    var id: String
    
    @Parameter(title: "Input text")
    var inputText: String
    
    init() {}
    
    init(inputText: String) {
        id = "doneKey"
        self.inputText = inputText
    }
    
    func perform() async throws -> some IntentResult {
        await SwiftDataStore.shared.addTask(name: inputText)
        KeyboardInputManager.shared.clearInputText()
        ScreenManager.shared.changeScreen(into: .main)
        
        return .result()
    }
}
