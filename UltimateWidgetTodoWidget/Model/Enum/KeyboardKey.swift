//
//  KeyboardKey.swift
//  UltimateWidgetTodo
//
//

enum KeyboardKey {
    case alphabet
    case numberAndPunctuationMarks
    case extraPunctuationMarks
    
    var row: KeyboardRow {
        switch self {
        case .alphabet:
            return KeyboardRow(
                topKeys: ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
                centerKeys: ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
                bottomKeys: ["Z", "X", "C", "V", "B", "N", "M"]
            )
        case .numberAndPunctuationMarks:
            return KeyboardRow(
                topKeys: ["1", "2", "3", "4", "5" , "6", "7", "8", "9", "0"],
                centerKeys: ["-", "/", ":", ";", "(" , ")", "$", "&", "@", "“"],
                bottomKeys: [".", ",", "?", "!", "‘"]
            )
        case .extraPunctuationMarks:
            return KeyboardRow(
                topKeys: ["[", "]", "{", "}", "#" , "%", "^", "*", "+", "="],
                centerKeys: ["_", "\\", "|", "~", "<" , ">", "€", "£", "¥", "•"],
                bottomKeys: []
            )
        }
    }
    
    struct KeyboardRow {
        let topKeys: [String]
        let centerKeys: [String]
        let bottomKeys: [String]
    }
}

