//
//  WidgetTodoCoreTests.swift
//  UltimateWidgetTodoTests
//
//

import XCTest
@testable import UltimateWidgetTodo

final class WidgetTodoCoreTests: XCTestCase {
    
    let core = WidgetTodoCore.test
    let store = UserDefaultsStore.testStore
    let swiftDataStore = SwiftDataStore.testStore
    
    override func setUpWithError() throws {
        store.removeAll()
    }
    
    func test_currentEmojiCategory() {
        
        XCTAssertEqual(core.currentEmojiCategory, .frequentlyUsed)
        XCTAssertEqual(core.currentEmojiCategory, .smilyAndPeople)
        core.onTapEmojiCategoryKey(.smilyAndPeople)
        core.onTapEmojiCategoryKey(.animalsAndNature)
        XCTAssertEqual(core.currentEmojiCategory, .animalsAndNature)
        core.onTapEmojiCategoryKey(.flags)
        XCTAssertEqual(core.currentEmojiCategory, .flags)
        core.onTapEmojiCategoryKey(.frequentlyUsed)
        XCTAssertEqual(core.currentEmojiCategory, .frequentlyUsed)
    }
    
    func test_currentEmojiContent() {
        
        XCTContext.runActivity(named: "Frequently used emojis are selected") { _ in
            core.onTapEmojiKey("😃")
            core.onTapEmojiKey("😁")
            XCTAssertEqual(core.currentEmojiContent, ["😁", "😃"])
        }
        
        let animalsEmojiStartIndex = EmojiKeyboardContent.Category.animalsAndNature.info.startIndex
        
        XCTContext.runActivity(named: "When the category is switched to Animals and Nature") { _ in
            let animalEmojis = EmojiKeyboardContent().getEmojis(for: animalsEmojiStartIndex)
            core.onTapEmojiCategoryKey(.animalsAndNature)
            XCTAssertEqual(core.currentEmojiContent, animalEmojis)
        }
        
        XCTContext.runActivity(named: "When going back to Smily and People") { _ in
            let smilyEmojiLastIndex = animalsEmojiStartIndex - 1
            let smilyEmojis = EmojiKeyboardContent().getEmojis(for: smilyEmojiLastIndex)
            core.onTapGoBackEmojiContentKey()
            XCTAssertEqual(core.currentEmojiContent, smilyEmojis)
        }
        
        XCTContext.runActivity(named: "When going forward to Activity") { _ in
            let foodAndDrinkEndIndex = EmojiKeyboardContent.Category.foodAndDrinkStartIndex.info.endIndex
            let foodEmojis = EmojiKeyboardContent().getEmojis(for: foodAndDrinkEndIndex)
            core.onTapEmojiCategoryKey(.foodAndDrinkStartIndex)
            core.onTapGoForwardEmojiContentKey()
            core.onTapGoForwardEmojiContentKey()
            core.onTapGoForwardEmojiContentKey()
            XCTAssertEqual(core.currentEmojiContent, foodEmojis)
            
            let activityStartIndex = foodAndDrinkEndIndex + 1
            let activityEmojis = EmojiKeyboardContent().getEmojis(for: activityStartIndex)
            
            core.onTapGoForwardEmojiContentKey()
            XCTAssertEqual(core.currentEmojiContent, activityEmojis)
        }
    }
    
    func test_currentScreen() {
        XCTAssertEqual(core.currentScreen, .main)
        
        core.onTapPresentAddItemView()
        XCTAssertEqual(core.currentScreen, .addTodoItem)
        core.onTapCloseEditItemViewButton()
        XCTAssertEqual(core.currentScreen, .main)
        let itemId = UUID()
        core.onTapTodoItemListRow(id: itemId, name: "Test")
        XCTAssertEqual(core.currentScreen, .editTodoItem(id: itemId))
        core.onTapCloseEditItemViewButton()
        XCTAssertEqual(core.currentScreen, .main)
    }
    
    func test_error() {
        XCTAssertNil(core.error)
        core.showError(.todoItemNameLimitExceeded)
        XCTAssertEqual(core.error, .todoItemNameLimitExceeded)
        core.onTapErrorOKButton()
        XCTAssertNil(core.error)
        core.showError(.unknown)
        XCTAssertEqual(core.error, .unknown)
    }
    
    func test_inputText() {
        XCTAssertTrue(core.inputText.isEmpty)
        core.onTapCharacterKey("ABC")
        XCTAssertEqual(core.inputText, "ABC")
        core.onTapEmojiKey("😁")
        XCTAssertEqual(core.inputText, "ABC😁")
    }
    
    func test_isCapsLocked() {
        XCTAssertFalse(core.isCapsLocked)
        core.onTapCapsLockKey()
        XCTAssertTrue(core.isCapsLocked)
        core.onTapCapsLockKey()
        XCTAssertFalse(core.isCapsLocked)
    }
    
    func test_isEmojiFirstContent() {
        XCTAssertTrue(core.isEmojiFirstContent)
        core.onTapEmojiCategoryKey(.animalsAndNature)
        XCTAssertFalse(core.isEmojiFirstContent)
    }
    
    func test_isEmojiLastContent() {
        XCTAssertFalse(core.isEmojiLastContent)
        core.onTapEmojiCategoryKey(.flags)
        XCTAssertFalse(core.isEmojiLastContent)
        
        for _ in 0...6 {
            core.onTapGoForwardEmojiContentKey()
        }
        XCTAssertTrue(core.isEmojiLastContent)
    }
    
    func test_isEmojiMode() {
        XCTAssertFalse(core.isEmojiMode)
        core.onTapEmojiModeKey()
        XCTAssertTrue(core.isEmojiMode)
    }
    
    func test_isNumberMode() {
        XCTAssertFalse(core.isNumberMode)
        core.onTapNumberModeKey()
        XCTAssertTrue(core.isNumberMode)
    }
    
    func test_keyboardBottomRowKeys() {
        XCTAssertEqual(core.keyboardBottomRowKeys, KeyboardInputMode.alphabet.keyboardRow.bottomKeys)
        core.onTapNumberModeKey()
        XCTAssertEqual(core.keyboardBottomRowKeys, KeyboardInputMode.number.keyboardRow.bottomKeys)
    }
    
    func test_keyboardCenterRowKeys() {
        XCTAssertEqual(core.keyboardCenterRowKeys, KeyboardInputMode.alphabet.keyboardRow.centerKeys)
        core.onTapNumberModeKey()
        XCTAssertEqual(core.keyboardCenterRowKeys, KeyboardInputMode.number.keyboardRow.centerKeys)
    }
    
    func test_keyboardInputMode() {
        XCTAssertEqual(core.keyboardInputMode, .alphabet)
        core.onTapEmojiModeKey()
        XCTAssertEqual(core.keyboardInputMode, .emoji)
        core.onTapNumberModeKey()
        XCTAssertEqual(core.keyboardInputMode, .number)
        core.onTapExtraPunctuationMarksKey()
        XCTAssertEqual(core.keyboardInputMode, .extraPunctuationMarks)
        core.onTapAlphabetModeKey()
        XCTAssertEqual(core.keyboardInputMode, .alphabet)
    }
    
    func test_keyboardTopRowKeys() {
        XCTAssertEqual(core.keyboardTopRowKeys, KeyboardInputMode.alphabet.keyboardRow.topKeys)
        core.onTapNumberModeKey()
        XCTAssertEqual(core.keyboardTopRowKeys, KeyboardInputMode.number.keyboardRow.topKeys)
    }
    
    @MainActor
    func test_onTapAddItemDoneKey() async throws {
        
        // This text is empty
        XCTAssertTrue(core.inputText.isEmpty)

        core.onTapScrollDownList()
        XCTAssertEqual(store.listDisplayIndex, 1)
        
        var items = swiftDataStore.fetchItem()
        XCTAssertTrue(items.isEmpty)
        
        core.onTapPresentAddItemView()
        XCTAssertEqual(core.currentScreen, .addTodoItem)
        
        try await core.onTapAddItemDoneKey()
        
        XCTAssertTrue(core.inputText.isEmpty)
        XCTAssertEqual(store.listDisplayIndex, 1)
        
        items = swiftDataStore.fetchItem()
        XCTAssertTrue(items.isEmpty)
        
        XCTAssertEqual(core.currentScreen, .addTodoItem)
        
        // This text is over 30 characters
        core.onTapCharacterKey("This text is over 30 characters")
        
        await XCTAssertThrowsAsyncError(try await core.onTapAddItemDoneKey()) { error in
            XCTAssertEqual(error as? WidgetError, .todoItemNameLimitExceeded)
        }
        
        XCTAssertEqual(core.inputText, "This text is over 30 characters")
        XCTAssertEqual(store.listDisplayIndex, 1)
        
        items = swiftDataStore.fetchItem()
        XCTAssertTrue(items.isEmpty)
        
        XCTAssertEqual(core.currentScreen, .addTodoItem)
        
        // This text is meeting the condition
        core.onTapBackspaceKey()
        try await core.onTapAddItemDoneKey()
        
        XCTAssertTrue(core.inputText.isEmpty)
        XCTAssertEqual(store.listDisplayIndex, 0)
        
        items = swiftDataStore.fetchItem()
        XCTAssertEqual(items.count, 1)
        
        XCTAssertEqual(core.currentScreen, .main)
    }
    
    func test_onTapBackspaceKey() {
        core.onTapCharacterKey("ABCDEFG")
        XCTAssertEqual(core.inputText, "ABCDEFG")
        core.onTapBackspaceKey()
        XCTAssertEqual(core.inputText, "ABCDEF")
        core.onTapBackspaceKey()
        XCTAssertEqual(core.inputText, "ABCDE")
    }
    
    func test_onTapCloseEditItemViewButton() {
        core.onTapPresentAddItemView()
        XCTAssertEqual(core.currentScreen, .addTodoItem)
        core.onTapEmojiCategoryKey(.symbols)
        XCTAssertEqual(core.currentEmojiCategory, .symbols)
        core.onTapCharacterKey("Test")
        XCTAssertEqual(core.inputText, "Test")
        core.onTapEmojiModeKey()
        XCTAssertEqual(core.keyboardInputMode, .emoji)
        
        core.onTapCloseEditItemViewButton()
        
        XCTAssertEqual(core.currentScreen, .main)
        XCTAssertEqual(core.currentEmojiCategory, .frequentlyUsed)
        XCTAssertTrue(core.inputText.isEmpty)
        XCTAssertEqual(core.keyboardInputMode, .alphabet)
    }
    
    func test_onTapCompleteTodoItem() async throws {
        
        core.onTapCharacterKey("Test")
        try await core.onTapAddItemDoneKey()
        
        let item = await swiftDataStore.fetchItem().first
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.name, "Test")
        let id = item?.itemId
        
        try await core.onTapCompleteTodoItem(id: id ?? UUID())
        let items = await swiftDataStore.fetchItem()
        XCTAssertTrue(items.isEmpty)
    }
    
    @MainActor
    func test_onTapEditItemDoneKey() async throws {
        
        core.onTapCharacterKey("Test")
        try await core.onTapAddItemDoneKey()
        
        var item = swiftDataStore.fetchItem().first
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.name, "Test")
        let id = item?.itemId
        let updateDate = item?.updateDate
        
        // This text is empty
        XCTAssertTrue(core.inputText.isEmpty)

        core.onTapScrollDownList()
        XCTAssertEqual(store.listDisplayIndex, 1)
        
        core.onTapTodoItemListRow(id: id!, name: item!.name)
        XCTAssertEqual(core.currentScreen, .editTodoItem(id: id!))
        
        for _ in 0...3  {
            core.onTapBackspaceKey()
        }
        XCTAssertTrue(core.inputText.isEmpty)
        
        try await core.onTapEditItemDoneKey(id: id!)
        
        XCTAssertTrue(core.inputText.isEmpty)
        XCTAssertEqual(store.listDisplayIndex, 1)
        
        item = swiftDataStore.fetchItem().first
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.name, "Test")
        
        XCTAssertEqual(core.currentScreen, .editTodoItem(id: id!))
        
        // This text is over 30 characters
        core.onTapCharacterKey("This text is over 30 characters")
        
        await XCTAssertThrowsAsyncError(try await core.onTapEditItemDoneKey(id: id!)) { error in
            XCTAssertEqual(error as? WidgetError, .todoItemNameLimitExceeded)
        }
        
        XCTAssertEqual(core.inputText, "This text is over 30 characters")
        XCTAssertEqual(store.listDisplayIndex, 1)
        
        item = swiftDataStore.fetchItem().first
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.name, "Test")
        
        XCTAssertEqual(core.currentScreen, .editTodoItem(id: id!))
        
        // This text is meeting the condition
        core.onTapBackspaceKey()
        try await core.onTapEditItemDoneKey(id: id!)
        
        XCTAssertTrue(core.inputText.isEmpty)
        XCTAssertEqual(store.listDisplayIndex, 1)
        
        item = swiftDataStore.fetchItem().first
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.name, "This text is over 30 character")
        XCTAssertNotEqual(item?.updateDate, updateDate)
        
        XCTAssertEqual(core.currentScreen, .main)
    }
    
    func test_onTapPresentAddItemView() {
        XCTAssertFalse(core.isCapsLocked)

        XCTAssertEqual(store.screenType, .main)
        core.onTapPresentAddItemView()
        XCTAssertTrue(core.isCapsLocked)
        XCTAssertEqual(core.currentScreen, .addTodoItem)
    }
    
    func test_onTapScrollDownList() {
        let items = SwiftDataStore.testStore.createItems(count: 10)
        
        XCTContext.runActivity(named: "Current index is 0") { _ in
            let control = core.makeListDisplayControl(for: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "0")
            XCTAssertEqual(control.displayItems[5].name, "5")
        }
        
        core.onTapScrollDownList()
        
        XCTContext.runActivity(named: "Current index is 1") { _ in
            let control = core.makeListDisplayControl(for: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "1")
            XCTAssertEqual(control.displayItems[5].name, "6")
        }
        
        core.onTapScrollDownList()
        
        XCTContext.runActivity(named: "Current index is 2") { _ in
            let control = core.makeListDisplayControl(for: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "2")
            XCTAssertEqual(control.displayItems[5].name, "7")
        }
    }
    
    func test_onTapScrollUpList() {
        let items = SwiftDataStore.testStore.createItems(count: 10)
        
        store.listDisplayIndex = 5
        XCTContext.runActivity(named: "Current index is 5") { _ in
            let control = core.makeListDisplayControl(for: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "4")
            XCTAssertEqual(control.displayItems[5].name, "9")
        }
        
        core.onTapScrollUpList()
        
        XCTContext.runActivity(named: "Current index is 4") { _ in
            let control = core.makeListDisplayControl(for: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "4")
            XCTAssertEqual(control.displayItems[5].name, "9")
        }
        
        core.onTapScrollUpList()
        
        XCTContext.runActivity(named: "Current index is 3") { _ in
            let control = core.makeListDisplayControl(for: items)
            XCTAssertEqual(control.displayItems.count, WidgetConfig.displayTodoItemLimitCount)
            XCTAssertEqual(control.displayItems[0].name, "3")
            XCTAssertEqual(control.displayItems[5].name, "8")
        }
    }
    
    func test_showError() {
        XCTAssertNil(core.error)
        core.showError(.todoItemDeletionFailure)
        XCTAssertEqual(core.error, .todoItemDeletionFailure)
        core.showError(.todoItemDeletionFailure)
        XCTAssertEqual(core.error, .todoItemDeletionFailure)
        core.onTapErrorOKButton()
        XCTAssertNil(core.error)
    }
}

extension XCTestCase {
    
    func XCTAssertThrowsAsyncError<T>(
        _ expression: @autoclosure () async throws -> T,
        _ message: @autoclosure () -> String = "",
        file: StaticString = #filePath,
        line: UInt = #line,
        _ errorHandler: (_ error: Error) -> Void = { _ in }
    ) async {
        do {
            _ = try await expression()
            // expected error to be thrown, but it was not
            let customMessage = message()
            if customMessage.isEmpty {
                XCTFail("Asynchronous call did not throw an error.", file: file, line: line)
            } else {
                XCTFail(customMessage, file: file, line: line)
            }
        } catch {
            errorHandler(error)
        }
    }
}
