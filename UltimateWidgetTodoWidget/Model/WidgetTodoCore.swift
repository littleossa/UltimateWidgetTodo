//
//  WidgetTodoCore.swift
//  UltimateWidgetTodo
//
//

import SwiftData
import SwiftUI

class WidgetTodoCore: ObservableObject {
    
    static let shared = WidgetTodoCore()
    static let test = WidgetTodoCore(isTestMode: true)
        
    private init(isTestMode: Bool = false) {
        self.keyboardInputRepository = .init(store: isTestMode ? .testStore : .shared)
        self.screenStateRepository = .init(store: isTestMode ? .testStore : .shared)
        self.taskRepository = .init(store: isTestMode ? .testStore : .shared)
    }
    
    private let keyboardInputRepository: KeyboardInputRepository
    private let screenStateRepository: ScreenStateRepository
    private let taskRepository: TaskRepository
    
    var currentScreen: ScreenType {
        return screenStateRepository.currentScreen
    }
    
    var inputText: String {
        return keyboardInputRepository.inputText
    }
    
    var isCapsLocked: Bool {
        return keyboardInputRepository.isCapsLocked
    }
    
    var isNumberMode: Bool {
        return keyboardInputRepository.isNumberMode
    }
    
    var keyboardInputMode: KeyboardInputMode {
        return keyboardInputRepository.inputMode
    }
    
    var swiftDataContainer: ModelContainer {
        return taskRepository.container
    }
    
    func onTapAlphabetModeKey() {
        keyboardInputRepository.changeMode(into: .alphabet)
    }
    
    func onTapBackspaceKey() {
        keyboardInputRepository.deleteLastCharacter()
    }
    
    func onTapCapsLockKey() {
        keyboardInputRepository.toggleCapsLock()
    }
    
    func onTapCharacterKey(_ character: String) {
        keyboardInputRepository.input(character)
    }
    
    func onTapCloseButton() {
        keyboardInputRepository.clearInputText()
        screenStateRepository.changeScreen(into: .main)
    }
    
    func onTapDoneKey(type: EditTaskType) async {
        
        let name = keyboardInputRepository.inputText
        switch type {
        case .addNewTask:
            await addTask(name: name)
        case .editTask(let id):
            await editTask(id: id, name: name)
        }
    }
    
    func onTapExtraPunctuationMarksKey() {
        keyboardInputRepository.changeMode(into: .extraPunctuationMarks)
    }
    
    func onTapNumberModeKey() {
        keyboardInputRepository.changeMode(into: .number)
    }
    
    func onTapPresentAddTaskView() {
        screenStateRepository.changeScreen(into: .addTask)
    }
    
    func onTapCompleteTask(id: UUID) async throws {
        try await taskRepository.deleteTask(id: id)
    }
    
    func onTapTaskListRow(id: UUID, name: String) {
        keyboardInputRepository.input(name)
        screenStateRepository.changeScreen(into: .editTask(id: id))
    }
    
    private func addTask(name: String) async {
        await taskRepository.addTask(name: name)
        keyboardInputRepository.clearInputText()
        screenStateRepository.changeScreen(into: .main)
    }
    
    private func editTask(id: UUID, name: String) async {
        do {
            let task = try await taskRepository.fetchTask(id: id)
            task.name = name
            task.updateDate = Date()
            keyboardInputRepository.clearInputText()
            
            screenStateRepository.changeScreen(into: .main)
        } catch {
            // TODO: Error Handling
            print("error", error)
        }
    }
}

// MARK: - EnvironmentValues

struct WidgetTodoCoreEnvironmentKey: EnvironmentKey {
    typealias Value = WidgetTodoCore
    static var defaultValue: WidgetTodoCore = .shared
}

extension EnvironmentValues {
    var widgetTodoCore: WidgetTodoCore {
        get {
            self[WidgetTodoCoreEnvironmentKey.self]
        }
        set {
            self[WidgetTodoCoreEnvironmentKey.self] = newValue
        }
    }
}
