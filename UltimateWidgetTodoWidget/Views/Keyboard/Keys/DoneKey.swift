//
//  DoneKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI
import WidgetKit

struct DoneKey: View {
    
    let type: EditTaskType
    
    private var isEmptyText: Bool {
        return WidgetTodoCore().isEmptyInputText
    }
            
    var body: some View {
        
        Button(intent: DoneKeyIntent(type: type)) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(isEmptyText ? .keyDarkGray : .blue)
            }
            .overlay {
                Text("done")
                    .font(.system(size: 14))
                    .bold()
                    .foregroundStyle(isEmptyText ? .gray : .white)
            }
        }
    }
}

#Preview {
    Color.keyboardBackground
        .overlay {
            HStack {
                DoneKey(type: .addNewTask)
                DoneKey(type: .addNewTask)
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
        await WidgetTodoCore().onTapDoneKey(type: type)
        return .result()
    }
}
