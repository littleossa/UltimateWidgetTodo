//
//  EmojiKeyboardColumn.swift
//  UltimateWidgetTodo
//
//

import Foundation

struct EmojiKeyboardColumns {
    
    init(column1: [String], column2: [String], column3: [String], column4: [String], column5: [String], column6: [String], column7: [String], column8: [String]) {
        self.column1 = column1
        self.column2 = column2
        self.column3 = column3
        self.column4 = column4
        self.column5 = column5
        self.column6 = column6
        self.column7 = column7
        self.column8 = column8
    }
    
    init(emojis: [String]) {
        column1 = Array(emojis.prefix(5))
        column2 = Array(emojis.dropFirst(5).prefix(5))
        column3 = Array(emojis.dropFirst(10).prefix(5))
        column4 = Array(emojis.dropFirst(15).prefix(5))
        column5 = Array(emojis.dropFirst(20).prefix(5))
        column6 = Array(emojis.dropFirst(25).prefix(5))
        column7 = Array(emojis.dropFirst(30).prefix(5))
        column8 = Array(emojis.dropFirst(35).prefix(5))
    }
    
    let column1: [String]
    let column2: [String]
    let column3: [String]
    let column4: [String]
    let column5: [String]
    let column6: [String]
    let column7: [String]
    let column8: [String]
}

