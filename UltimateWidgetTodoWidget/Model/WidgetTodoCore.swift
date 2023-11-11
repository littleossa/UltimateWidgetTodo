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
    
    // MARK: - Properties
    
    var currentEmojiCategory: EmojiKeyboardContent.Category {
        return keyboardInputRepository.currentEmojiCategory
    }
    
    var currentEmojiContent: [String] {
        return keyboardInputRepository.currentEmojiContent
    }
    
    var currentScreen: ScreenType {
        return screenStateRepository.currentScreen
    }
    
    var inputText: String {
        return keyboardInputRepository.inputText
    }
    
    var isCapsLocked: Bool {
        return keyboardInputRepository.isCapsLocked
    }
    
    var isEmojiMode: Bool {
        return keyboardInputRepository.inputMode == .emoji
    }
    
    var isNumberMode: Bool {
        return keyboardInputRepository.inputMode == .number
    }
    
    var keyboardBottomRowKeys: [String] {
        return keyboardInputMode.keyboardRow.bottomKeys
    }
    
    var keyboardCenterRowKeys: [String] {
        return keyboardInputMode.keyboardRow.centerKeys
    }
    
    var keyboardInputMode: KeyboardInputMode {
        return keyboardInputRepository.inputMode
    }
    
    var keyboardTopRowKeys: [String] {
        return keyboardInputMode.keyboardRow.topKeys
    }
    
    var swiftDataContainer: ModelContainer {
        return taskRepository.container
    }
    
    // MARK: - Functions
    
    func onTapAddTaskDoneKey() async {
        let name = keyboardInputRepository.inputText
        await taskRepository.addTask(name: name)
        keyboardInputRepository.clearInputText()
        screenStateRepository.changeScreen(into: .main)
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
    
    func onTapEditTaskDoneKey(id: UUID) async {
        let name = keyboardInputRepository.inputText
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
    
    func onTapEmojiModeKey() {
        keyboardInputRepository.changeMode(into: .emoji)
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
