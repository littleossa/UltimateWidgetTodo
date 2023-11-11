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
        self.listDisplayRepository = .init(store: isTestMode ? .testStore : .shared)
        self.screenStateRepository = .init(store: isTestMode ? .testStore : .shared)
        self.taskRepository = .init(store: isTestMode ? .testStore : .shared)
    }
    
    private let keyboardInputRepository: KeyboardInputRepository
    private let listDisplayRepository: ListDisplayRepository
    private let screenStateRepository: ScreenStateRepository
    private let taskRepository: TaskRepository
    
    // MARK: - Properties
    @Published private(set) var listScrollTransition: AnyTransition = .identity
        
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
    
    var isEmojiFirstContent: Bool {
        return currentEmojiCategory == .frequentlyUsed
    }
    
    var isEmojiLastContent: Bool {
        return keyboardInputRepository.isEmojiLastContent
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
    
    func makeListDisplayControl(for tasks: [Task]) -> ListDisplayControl {
        return listDisplayRepository.makeListDisplayControl(for: tasks)
    }
    
    func onTapAddTaskDoneKey() async {
        let name = keyboardInputRepository.inputText
        if name.isEmpty { return }
        
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
        keyboardInputRepository.changeMode(into: .alphabet)
        keyboardInputRepository.moveEmojiContent(for: 0)
        keyboardInputRepository.clearInputText()
        screenStateRepository.changeScreen(into: .main)
    }
    
    func onTapCompleteTask(id: UUID) async throws {
        try await taskRepository.deleteTask(id: id)
    }
    
    func onTapDisabledScroll() {
        // need to Disable list animations
        listScrollTransition = .identity
    }
    
    func onTapEditTaskDoneKey(id: UUID) async {
        let name = keyboardInputRepository.inputText
        if name.isEmpty { return }

        do {
            let task = try await taskRepository.fetchTask(id: id)
            task.name = name
            task.updateDate = Date()
            
            keyboardInputRepository.changeMode(into: .alphabet)
            keyboardInputRepository.moveEmojiContent(for: 0)
            keyboardInputRepository.clearInputText()
            screenStateRepository.changeScreen(into: .main)
        } catch {
            // TODO: Error Handling
            print("error", error)
        }
    }
    
    func onTapEmojiCategoryKey(_ category: EmojiKeyboardContent.Category) {
        keyboardInputRepository.moveEmojiContent(for: category.info.startIndex)
    }
    
    func onTapEmojiKey(_ emoji: String) {
        keyboardInputRepository.appendFrequentlyUsedEmoji(emoji)
        keyboardInputRepository.input(emoji)
    }
    
    func onTapEmojiModeKey() {
        keyboardInputRepository.changeMode(into: .emoji)
    }
    
    func onTapExtraPunctuationMarksKey() {
        keyboardInputRepository.changeMode(into: .extraPunctuationMarks)
    }
    
    func onTapGoBackEmojiContentKey() {
        keyboardInputRepository.goBackEmojiContent()
    }
    
    func onTapGoForwardEmojiContentKey() {
        keyboardInputRepository.goForwardEmojiContent()
    }
    
    func onTapNumberModeKey() {
        keyboardInputRepository.changeMode(into: .number)
    }
    
    func onTapPresentAddTaskView() {
        screenStateRepository.changeScreen(into: .addTask)
    }
    
    func onTapScrollDownList() {
        listScrollTransition = .push(from: .bottom)
        listDisplayRepository.scrollDownList()
    }
    
    func onTapScrollUpList() {
        listScrollTransition = .push(from: .top)
        listDisplayRepository.scrollUpList()
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
