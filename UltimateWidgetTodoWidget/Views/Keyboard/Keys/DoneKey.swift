//
//  DoneKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI
import WidgetKit

struct DoneKey: View {
    
    init(inputText: String, type: EditTaskType) {
        self.inputText = inputText
        self.type = type
    }
    
    let inputText: String
    let type: EditTaskType
            
    var body: some View {
        
        Button(intent: DoneKeyIntent(type: type)) {
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
                DoneKey(inputText: "", type: .addNewTask)
                DoneKey(inputText: "something", type: .addNewTask)
            }
        }
}


struct DoneKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Done key"
    
    @Parameter(title: "Done Key")
    var id: String
    
    var type: EditTaskType = .addNewTask
    
    init() {}
    
    init(type: EditTaskType) {
        id = "doneKey"
        self.type = type
    }
    
    func perform() async throws -> some IntentResult {
        await WidgetTodoCore.shared.onTapDoneKey(type: type)
        return .result()
    }
}
