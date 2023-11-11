//
//  EmojiKeyboardContent+Category.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

extension EmojiKeyboardContent {
    
    enum Category: String, CaseIterable, Identifiable {
        case frequentlyUsed
        case smilyAndPeople
        case animalsAndNature
        case foodAndDrinkStartIndex
        case activity
        case travelAndPlaces
        case objects
        case symbols
        case flags
        
        struct Info {
            let icon: String
            let title: LocalizedStringKey
            let startIndex: Int
            let endIndex: Int
        }
        
        var id: String {
            return rawValue
        }
        
        var info: Info {
            switch self {
            case .frequentlyUsed:
                return .init(icon: "🕐",
                             title: "FREQUENTLY USED",
                             startIndex: 0,
                             endIndex: 0)
            case .smilyAndPeople:
                return .init(icon: "😃",
                             title: "SMILEYS & PEOPLE",
                             startIndex: 1,
                             endIndex: 13)
            case .animalsAndNature:
                return .init(icon: "🐻‍❄️",
                             title: "ANIMALS & NATURE",
                             startIndex: 14,
                             endIndex: 19)
            case .foodAndDrinkStartIndex:
                return .init(icon: "🍔",
                             title: "FOOD & DRINK",
                             startIndex: 20,
                             endIndex: 23)
            case .activity:
                return .init(icon: "⚽️",
                             title: "ACTIVITY",
                             startIndex: 24,
                             endIndex: 26)
            case .travelAndPlaces:
                return .init(icon: "🚗",
                             title: "TRAVEL & PLACES",
                             startIndex: 27, endIndex: 30)
            case .objects:
                return .init(icon: "💡",
                             title: "OBJECTS",
                             startIndex: 31, endIndex: 36)
           
            case .symbols:
                return .init(icon: "🔣",
                             title: "SYMBOLS",
                             startIndex: 37, endIndex: 44)
            case .flags:
                return .init(icon: "🏁",
                             title: "FLAGS",
                             startIndex: 45,
                             endIndex: 51)
            }
        }
    }
}
