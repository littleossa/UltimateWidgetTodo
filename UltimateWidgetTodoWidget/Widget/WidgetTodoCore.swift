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
        let userDefaultsStore: UserDefaultsStore = isTestMode ? .testStore : .shared
        let swiftDataStore: SwiftDataStore = isTestMode ? .testStore : .shared
        
        self.keyboardInputRepository = .init(store: userDefaultsStore)
        self.listDisplayRepository = .init(store: userDefaultsStore)
        self.screenStateRepository = .init(store: userDefaultsStore)
        self.todoItemRepository = .init(store: swiftDataStore)
    }
    
    private let keyboardInputRepository: KeyboardInputRepository
    private let listDisplayRepository: ListDisplayRepository
    private let screenStateRepository: ScreenStateRepository
    private let todoItemRepository: TodoItemRepository
    
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
    
    var error: WidgetError? {
        return screenStateRepository.error
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
        return todoItemRepository.container
    }
    
    // MARK: - Functions
    
    func makeListDisplayControl(for items: [TodoItem]) -> ListDisplayControl {
        return ListDisplayControl(currentIndex: listDisplayRepository.currentIndex,
                                  items: items)
    }
    
    func onTapAddItemDoneKey() async throws {
        let name = keyboardInputRepository.inputText
        if name.isEmpty { return }
        
        guard name.count <= WidgetConfig.todoItemNameLimitCount
        else { throw WidgetError.todoItemNameLimitExceeded }
        
        listDisplayRepository.updateIndex(to: 0)
        await todoItemRepository.addItem(name: name)
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
    
    func onTapCloseAddItemViewButton() {
        closeEditItemView()
    }
    
    func onTapCloseEditItemViewButton() {
        closeEditItemView()
    }
    
    func onTapCompleteTodoItem(id: UUID) async throws {
        try await todoItemRepository.deleteItem(id: id)
        listScrollTransition = .identity
    }
    
    func onTapDisabledScroll() {
        // need to Disable list animations
        listScrollTransition = .identity
    }
    
    func onTapEditItemDoneKey(id: UUID) async throws {
        let name = keyboardInputRepository.inputText
        if name.isEmpty { return }
        
        guard name.count <= WidgetConfig.todoItemNameLimitCount
        else { throw WidgetError.todoItemNameLimitExceeded }
        
        let item = try await todoItemRepository.fetchItem(id: id)
        item.name = name
        item.updateDate = Date()
        
        keyboardInputRepository.changeMode(into: .alphabet)
        keyboardInputRepository.moveEmojiContent(for: 0)
        keyboardInputRepository.clearInputText()
        
        screenStateRepository.changeScreen(into: .main)
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
    
    func onTapErrorOKButton() {
        screenStateRepository.resetError()
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
    
    func onTapPresentAddItemView() {
        screenStateRepository.changeScreen(into: .addTodoItem)
    }
    
    func onTapScrollDownList() {
        listScrollTransition = .push(from: .bottom)
        listDisplayRepository.scrollDownList()
    }
    
    func onTapScrollUpList() {
        listScrollTransition = .push(from: .top)
        listDisplayRepository.scrollUpList()
    }
    
    func onTapTodoItemListRow(id: UUID, name: String) {
        keyboardInputRepository.input(name)
        screenStateRepository.changeScreen(into: .editTodoItem(id: id))
    }
    
    func showError(_ error: WidgetError) {
        screenStateRepository.setError(error)
    }
    
    // MARK: - Helper Function
    
    private func closeEditItemView() {
        keyboardInputRepository.changeMode(into: .alphabet)
        keyboardInputRepository.moveEmojiContent(for: 0)
        keyboardInputRepository.clearInputText()
        screenStateRepository.changeScreen(into: .main)
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
