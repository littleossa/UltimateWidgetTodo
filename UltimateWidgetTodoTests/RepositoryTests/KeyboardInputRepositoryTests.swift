//
//  KeyboardInputRepositoryTests.swift
//  UltimateWidgetTodoTests
//
//

import XCTest
@testable import UltimateWidgetTodo

final class KeyboardInputRepositoryTests: XCTestCase {
    
    let repository = KeyboardInputRepository(store: .testStore)
    let store: UserDefaultsStore = .testStore
    let emojiKeyboardContent = EmojiKeyboardContent()
    
    override func setUpWithError() throws {
        store.removeAll()
    }
    
    func test_currentEmojiCategory() {
        store.emojiKeyboardIndex = 0
        XCTAssertEqual(repository.currentEmojiCategory, .frequentlyUsed)

        store.emojiKeyboardIndex = 1
        XCTAssertEqual(repository.currentEmojiCategory, .smilyAndPeople)

        store.emojiKeyboardIndex = 14
        XCTAssertEqual(repository.currentEmojiCategory, .animalsAndNature)

        store.emojiKeyboardIndex = 20
        XCTAssertEqual(repository.currentEmojiCategory, .foodAndDrinkStartIndex)

        store.emojiKeyboardIndex = 24
        XCTAssertEqual(repository.currentEmojiCategory, .activity)

        store.emojiKeyboardIndex = 27
        XCTAssertEqual(repository.currentEmojiCategory, .travelAndPlaces)

        store.emojiKeyboardIndex = 31
        XCTAssertEqual(repository.currentEmojiCategory, .objects)

        store.emojiKeyboardIndex = 37
        XCTAssertEqual(repository.currentEmojiCategory, .symbols)

        store.emojiKeyboardIndex = 45
        XCTAssertEqual(repository.currentEmojiCategory, .flags)

        store.emojiKeyboardIndex = 52
        XCTAssertEqual(repository.currentEmojiCategory, .frequentlyUsed)
    }
    
    func test_currentEmojiContent() {
                
        XCTContext.runActivity(named: "emojiKeyboardIndex0 is frequentlyUsed") { _ in
            store.emojiKeyboardIndex = 0
            XCTAssertEqual(repository.currentEmojiContent, store.frequentlyUsedEmojis)
        }
        
        XCTContext.runActivity(named: "emojiKeyboardIndex is within the valid range") { _ in
            store.emojiKeyboardIndex = 15
            XCTAssertEqual(repository.currentEmojiContent, emojiKeyboardContent.getEmojis(for: 15))
        }
        
        XCTContext.runActivity(named: "emojiKeyboardIndex is greater than the keyboardEndIndex") { _ in
            store.emojiKeyboardIndex = emojiKeyboardContent.keyboardEndIndex + 1
            XCTAssertEqual(repository.currentEmojiContent, store.frequentlyUsedEmojis)
        }
    }
    
    func test_isEmojiLastContent() {
        store.emojiKeyboardIndex = 0
        XCTAssertFalse(repository.isEmojiLastContent)
        
        store.emojiKeyboardIndex = emojiKeyboardContent.keyboardEndIndex
        XCTAssertTrue(repository.isEmojiLastContent)
    }
    
    func test_appendFrequentlyUsedEmoji() {
        store.frequentlyUsedEmojis = ["😃", "🐱", "🍎"]
        
        XCTContext.runActivity(named: "Emoji is not in the list") { _ in
            repository.appendFrequentlyUsedEmoji("🚀")
            XCTAssertEqual(store.frequentlyUsedEmojis, ["🚀", "😃", "🐱", "🍎"])
        }
        
        XCTContext.runActivity(named: "Emoji is already in the list") { _ in
            repository.appendFrequentlyUsedEmoji("😃")
            XCTAssertEqual(store.frequentlyUsedEmojis, ["😃", "🚀", "🐱", "🍎"])
        }
        

        XCTContext.runActivity(named: "Emoji list is at the limit") { _ in
            store.frequentlyUsedEmojis = ["🧜", "🧜‍♂️", "🧚‍♀️", "🧚", "🧚‍♂️", "👼", "🤰", "🫄", "🫃", "🤱", "👩‍🍼", "🧑‍🍼", "👨‍🍼", "🙇‍♀️", "🙇", "🙇‍♂️", "💁‍♀️", "💁", "💁‍♂️", "🙅‍♀️", "🙅", "🙅‍♂️", "🙆‍♀️", "🙆", "🙆‍♂️", "🙋‍♀️", "🙋", "🙋‍♂️", "🧏‍♀️", "🧏", "🧏‍♂️", "🤦‍♀️", "🤦", "🤦🏻‍♂️", "🤷‍♀️", "🤷", "🤷‍♂️", "🙎‍♀️", "🙎", "🙎‍♂️"]
            XCTAssertEqual(store.frequentlyUsedEmojis.count, WidgetConfig.emojiKeyboardContentLimitCount)
            repository.appendFrequentlyUsedEmoji("🎉")
            XCTAssertEqual(store.frequentlyUsedEmojis, ["🎉", "🧜", "🧜‍♂️", "🧚‍♀️", "🧚", "🧚‍♂️", "👼", "🤰", "🫄", "🫃", "🤱", "👩‍🍼", "🧑‍🍼", "👨‍🍼", "🙇‍♀️", "🙇", "🙇‍♂️", "💁‍♀️", "💁", "💁‍♂️", "🙅‍♀️", "🙅", "🙅‍♂️", "🙆‍♀️", "🙆", "🙆‍♂️", "🙋‍♀️", "🙋", "🙋‍♂️", "🧏‍♀️", "🧏", "🧏‍♂️", "🤦‍♀️", "🤦", "🤦🏻‍♂️", "🤷‍♀️", "🤷", "🤷‍♂️", "🙎‍♀️", "🙎"])
        }
    }
    
    func test_clearInputText() {
        store.inputText = "Test"
        XCTAssertEqual(repository.inputText, "Test")
        
        repository.clearInputText()
        XCTAssertEqual(repository.inputText, "")
    }
    
    func test_input() {
        repository.input("A")
        XCTAssertEqual(repository.inputText, "A")
        repository.input("B")
        XCTAssertEqual(repository.inputText, "AB")
    }
    
    func test_changeMode() {
        repository.changeMode(into: .emoji)
        XCTAssertEqual(repository.inputMode, .emoji)
        
        repository.changeMode(into: .alphabet)
        XCTAssertEqual(repository.inputMode, .alphabet)
        
        repository.changeMode(into: .extraPunctuationMarks)
        XCTAssertEqual(repository.inputMode, .extraPunctuationMarks)
        
        repository.changeMode(into: .number)
        XCTAssertEqual(repository.inputMode, .number)
    }
    
    func test_deleteLastCharacter() {
        repository.input("Test")
        repository.deleteLastCharacter()
        XCTAssertEqual(repository.inputText, "Tes")
    }
    
    func test_goBackEmojiContent() {
        store.emojiKeyboardIndex = 3
        repository.goBackEmojiContent()
        XCTAssertEqual(repository.emojiKeyboardIndex, 2)
        repository.goBackEmojiContent()
        XCTAssertEqual(repository.emojiKeyboardIndex, 1)
        repository.goBackEmojiContent()
        XCTAssertEqual(repository.emojiKeyboardIndex, 0)
        repository.goBackEmojiContent()
        XCTAssertEqual(repository.emojiKeyboardIndex, 0)
    }
    
    func test_goForwardEmojiContent() {
        store.emojiKeyboardIndex = 49
        repository.goForwardEmojiContent()
        XCTAssertEqual(repository.emojiKeyboardIndex, 50)
        repository.goForwardEmojiContent()
        XCTAssertEqual(repository.emojiKeyboardIndex, 51)
        repository.goForwardEmojiContent()
        XCTAssertEqual(repository.emojiKeyboardIndex, 51)
    }
    
    func test_moveEmojiContent() {
        repository.moveEmojiContent(for: 2)
        XCTAssertEqual(repository.emojiKeyboardIndex, 2)
    }
    
    func testToggleCapsLock() {
        store.isCapsLocked = true
        XCTAssertTrue(repository.isCapsLocked)
        repository.toggleCapsLock()
        XCTAssertFalse(repository.isCapsLocked)
        repository.toggleCapsLock()
        XCTAssertTrue(repository.isCapsLocked)
    }
}
