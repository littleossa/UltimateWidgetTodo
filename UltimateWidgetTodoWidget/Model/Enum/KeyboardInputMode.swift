//
//  KeyboardInputMode.swift
//  UltimateWidgetTodo
//
//

enum KeyboardInputMode: String {
    case alphabet
    case emoji
    case extraPunctuationMarks
    case number
    
    var keyboardRow: KeyboardRow {
        switch self {
        case .alphabet:
            return .init(
                topKeys: ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
                centerKeys: ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
                bottomKeys: ["Z", "X", "C", "V", "B", "N", "M"]
            )
            // TODO: Emoji keys
        case .emoji:
            return .init(
                topKeys: [],
                centerKeys: [],
                bottomKeys: []
            )
        case .extraPunctuationMarks:
            return KeyboardRow(
                topKeys: ["[", "]", "{", "}", "#" , "%", "^", "*", "+", "="],
                centerKeys: ["_", "\\", "|", "~", "<" , ">", "€", "£", "¥", "•"],
                bottomKeys: [".", ",", "?", "!", "‘"]
            )
        case .number:
            return .init(
                topKeys: ["1", "2", "3", "4", "5" , "6", "7", "8", "9", "0"],
                centerKeys: ["-", "/", ":", ";", "(" , ")", "$", "&", "@", "“"],
                bottomKeys: [".", ",", "?", "!", "‘"]
            )
        }
    }
    
    struct KeyboardRow {
        let topKeys: [String]
        let centerKeys: [String]
        let bottomKeys: [String]
    }
}

