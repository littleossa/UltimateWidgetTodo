//
//  EmojiKeyboardContent+Category.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

extension EmojiKeyboardContent {
    
    enum Category: String {
        case activity
        case animalsAndNature
        case flags
        case foodAndDrinkStartIndex
        case frequentlyUsed
        case objects
        case smilyAndPeople
        case symbols
        case travelAndPlaces
        
        struct Info {
            let icon: String
            let title: LocalizedStringKey
            let startIndex: Int
            let endIndex: Int
        }
        
        var info: Info {
            switch self {
            case .activity:
                return .init(icon: "⚽️",
                             title: "ACTIVITY",
                             startIndex: 24,
                             endIndex: 26)
            case .animalsAndNature:
                return .init(icon: "🐻‍❄️",
                             title: "ANIMALS & NATURE",
                             startIndex: 14,
                             endIndex: 19)
            case .flags:
                return .init(icon: "🏁",
                             title: "FLAGS",
                             startIndex: 45,
                             endIndex: 51)
            case .foodAndDrinkStartIndex:
                return .init(icon: "🍔",
                             title: "FOOD & DRINK",
                             startIndex: 20,
                             endIndex: 23)
            case .frequentlyUsed:
                return .init(icon: "🕐",
                             title: "FREQUENTLY USED",
                             startIndex: 0,
                             endIndex: 0)
            case .objects:
                return .init(icon: "💡",
                             title: "OBJECTS",
                             startIndex: 31, endIndex: 36)
            case .smilyAndPeople:
                return .init(icon: "😃",
                             title: "SMILEYS & PEOPLE",
                             startIndex: 1, endIndex: 13)
            case .symbols:
                return .init(icon: "🔣",
                             title: "SYMBOLS",
                             startIndex: 37, endIndex: 44)
            case .travelAndPlaces:
                return .init(icon: "🚗",
                             title: "TRAVEL & PLACES",
                             startIndex: 27, endIndex: 30)
            }
        }
    }
}
