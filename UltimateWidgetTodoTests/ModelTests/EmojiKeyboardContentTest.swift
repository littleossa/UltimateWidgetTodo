//
//  EmojiKeyboardContentTest.swift
//  UltimateWidgetTodoTests
//
//

import XCTest
@testable import UltimateWidgetTodo

final class EmojiKeyboardContentTest: XCTestCase {
    
    let content = EmojiKeyboardContent()
    
    func test_keyboardEndIndex() {
        XCTAssertEqual(content.keyboardEndIndex, EmojiKeyboardContent.Category.flags.info.endIndex)
    }
    
    func test_getCategory() {
        XCTAssertEqual(content.getCategory(for: 0), .frequentlyUsed)
        XCTAssertEqual(content.getCategory(for: 1), .smilyAndPeople)
        XCTAssertEqual(content.getCategory(for: 13), .smilyAndPeople)
        XCTAssertEqual(content.getCategory(for: 14), .animalsAndNature)
        XCTAssertEqual(content.getCategory(for: 19), .animalsAndNature)
        XCTAssertEqual(content.getCategory(for: 20), .foodAndDrinkStartIndex)
        XCTAssertEqual(content.getCategory(for: 23), .foodAndDrinkStartIndex)
        XCTAssertEqual(content.getCategory(for: 24), .activity)
        XCTAssertEqual(content.getCategory(for: 26), .activity)
        XCTAssertEqual(content.getCategory(for: 27), .travelAndPlaces)
        XCTAssertEqual(content.getCategory(for: 30), .travelAndPlaces)
        XCTAssertEqual(content.getCategory(for: 31), .objects)
        XCTAssertEqual(content.getCategory(for: 36), .objects)
        XCTAssertEqual(content.getCategory(for: 37), .symbols)
        XCTAssertEqual(content.getCategory(for: 44), .symbols)
        XCTAssertEqual(content.getCategory(for: 45), .flags)
        XCTAssertEqual(content.getCategory(for: 51), .flags)
        XCTAssertEqual(content.getCategory(for: 52), .frequentlyUsed)
        
        // Test default case
        XCTAssertEqual(content.getCategory(for: 100), .frequentlyUsed)
    }

    func test_categoryInfo() {
        XCTAssertEqual(EmojiKeyboardContent.Category.frequentlyUsed.info.icon, "🕐")
        XCTAssertEqual(EmojiKeyboardContent.Category.frequentlyUsed.info.title, "FREQUENTLY USED")
        XCTAssertEqual(EmojiKeyboardContent.Category.frequentlyUsed.info.startIndex, 0)
        XCTAssertEqual(EmojiKeyboardContent.Category.frequentlyUsed.info.endIndex, 0)
        
        XCTAssertEqual(EmojiKeyboardContent.Category.smilyAndPeople.info.icon, "😃")
        XCTAssertEqual(EmojiKeyboardContent.Category.smilyAndPeople.info.title, "SMILEYS & PEOPLE")
        XCTAssertEqual(EmojiKeyboardContent.Category.smilyAndPeople.info.startIndex, 1)
        XCTAssertEqual(EmojiKeyboardContent.Category.smilyAndPeople.info.endIndex, 13)
        
        XCTAssertEqual(EmojiKeyboardContent.Category.animalsAndNature.info.icon, "🐻‍❄️")
        XCTAssertEqual(EmojiKeyboardContent.Category.animalsAndNature.info.title, "ANIMALS & NATURE")
        XCTAssertEqual(EmojiKeyboardContent.Category.animalsAndNature.info.startIndex, 14)
        XCTAssertEqual(EmojiKeyboardContent.Category.animalsAndNature.info.endIndex, 19)
        
        XCTAssertEqual(EmojiKeyboardContent.Category.foodAndDrinkStartIndex.info.icon, "🍔")
        XCTAssertEqual(EmojiKeyboardContent.Category.foodAndDrinkStartIndex.info.title, "FOOD & DRINK")
        XCTAssertEqual(EmojiKeyboardContent.Category.foodAndDrinkStartIndex.info.startIndex, 20)
        XCTAssertEqual(EmojiKeyboardContent.Category.foodAndDrinkStartIndex.info.endIndex, 23)
        
        XCTAssertEqual(EmojiKeyboardContent.Category.activity.info.icon, "⚽️")
        XCTAssertEqual(EmojiKeyboardContent.Category.activity.info.title, "ACTIVITY")
        XCTAssertEqual(EmojiKeyboardContent.Category.activity.info.startIndex, 24)
        XCTAssertEqual(EmojiKeyboardContent.Category.activity.info.endIndex, 26)
        
        XCTAssertEqual(EmojiKeyboardContent.Category.travelAndPlaces.info.icon, "🚗")
        XCTAssertEqual(EmojiKeyboardContent.Category.travelAndPlaces.info.title, "TRAVEL & PLACES")
        XCTAssertEqual(EmojiKeyboardContent.Category.travelAndPlaces.info.startIndex, 27)
        XCTAssertEqual(EmojiKeyboardContent.Category.travelAndPlaces.info.endIndex, 30)
        
        XCTAssertEqual(EmojiKeyboardContent.Category.objects.info.icon, "💡")
        XCTAssertEqual(EmojiKeyboardContent.Category.objects.info.title, "OBJECTS")
        XCTAssertEqual(EmojiKeyboardContent.Category.objects.info.startIndex, 31)
        XCTAssertEqual(EmojiKeyboardContent.Category.objects.info.endIndex, 36)
        
        XCTAssertEqual(EmojiKeyboardContent.Category.symbols.info.icon, "🔣")
        XCTAssertEqual(EmojiKeyboardContent.Category.symbols.info.title, "SYMBOLS")
        XCTAssertEqual(EmojiKeyboardContent.Category.symbols.info.startIndex, 37)
        XCTAssertEqual(EmojiKeyboardContent.Category.symbols.info.endIndex, 44)
        
        XCTAssertEqual(EmojiKeyboardContent.Category.flags.info.icon, "🏁")
        XCTAssertEqual(EmojiKeyboardContent.Category.flags.info.title, "FLAGS")
        XCTAssertEqual(EmojiKeyboardContent.Category.flags.info.startIndex, 45)
        XCTAssertEqual(EmojiKeyboardContent.Category.flags.info.endIndex, 51)
    }
}
