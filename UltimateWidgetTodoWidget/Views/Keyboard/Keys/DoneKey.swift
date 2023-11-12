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
    
    private var DoneKeyIntent: any AppIntent {
        switch type {
        case .addNewTask:
            return AddTaskDoneKeyIntent()
        case .editTask(let id):
            return EditTaskDoneKeyIntent(taskId: id)
        }
    }
            
    var body: some View {
        
        Button(intent: DoneKeyIntent) {
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


struct AddTaskDoneKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Add Task Done key"
    
    @Parameter(title: "Add Task Done Key")
    var id: String
        
    init() {
        id = "AddTaskDoneKey"
    }
    
    func perform() async throws -> some IntentResult {
        do {
            try await WidgetTodoCore.shared.onTapAddTaskDoneKey()
        } catch {
            let widgetError = error as? WidgetError
            WidgetTodoCore.shared.showError(widgetError ?? .unknown)
        }
        return .result()
    }
}

struct EditTaskDoneKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Edit Task Done key"
    
    @Parameter(title: "Edit Task Done Key")
    var id: String
    
    var type: EditTaskType = .addNewTask
    
    init() {}
    
    init(taskId: UUID) {
        id = taskId.uuidString
    }
    
    func perform() async throws -> some IntentResult {
        
        if let uuid = UUID(uuidString: id) {
            do {
                try await WidgetTodoCore.shared.onTapEditTaskDoneKey(id: uuid)
            } catch {
                let widgetError = error as? WidgetError
                WidgetTodoCore.shared.showError(widgetError ?? .taskEditingFailure)
            }
        }
        return .result()
    }
}
