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
    
    private var inputText: String {
        return KeyboardInputManager.shared.inputText
    }
            
    var body: some View {
        
        Button(intent: DoneKeyIntent(type: type, taskName: inputText)) {
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
                DoneKey(type: .addNewTask)
                DoneKey(type: .addNewTask)
            }
        }
}


struct DoneKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Done key"
    
    @Parameter(title: "Done Key")
    var id: String
    
    @Parameter(title: "Task name")
    var taskName: String
    
    var type: EditTaskType = .addNewTask
    
    init() {}
    
    init(type: EditTaskType, taskName: String) {
        id = "doneKey"
        self.taskName = taskName
        self.type = type
    }
    
    func perform() async throws -> some IntentResult {
        
        switch type {
        case .addNewTask:
            await addTask(name: taskName)
        case .editTask(let id):
            await editTask(id: id, name: taskName)
        }
        
        return .result()
    }
    
    private func addTask(name: String) async {
        await SwiftDataStore.shared.addTask(name: taskName)
        KeyboardInputManager.shared.clearInputText()
        ScreenManager.shared.changeScreen(into: .main)
    }
    
    private func editTask(id: UUID, name: String) async {
        do {
            let task = try await SwiftDataStore.shared.fetchTask(id: id)
            task.name = name
            task.updateDate = Date()
            KeyboardInputManager.shared.clearInputText()
            
            ScreenManager.shared.changeScreen(into: .main)
        } catch {
            // TODO: Error Handling
            print("error", error)
        }
    }
}
