//
//  NumberAndPunctuationMarkKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct NumberAndPunctuationMarkKeyboard: View {
    
    @Environment(\.widgetTodoCore) var core
    let type: EditTaskType
    
    private var topRowCharacters: [String] {
        if core.isNumberMode {
            return KeyboardKey.numberAndPunctuationMarks.row.topKeys
        } else {
            return KeyboardKey.extraPunctuationMarks.row.topKeys
        }
    }
    
    private var centerRowCharacters: [String] {
        if core.isNumberMode {
            return KeyboardKey.numberAndPunctuationMarks.row.centerKeys
        } else {
            return KeyboardKey.extraPunctuationMarks.row.centerKeys
        }
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            HStack(spacing: 6) {
                ForEach(topRowCharacters, id: \.self) {
                    KeyboardLetterKey($0, isCapsLocked: false)
                        .frame(width: 26, height: 34)
                }
            }
            
            HStack(spacing: 6) {
                ForEach(centerRowCharacters, id: \.self) {
                    KeyboardLetterKey($0, isCapsLocked: false)
                        .frame(width: 26, height: 34)
                }
            }
            
            HStack(spacing: 6) {
                
                HStack {
                    
                    if WidgetTodoCore.shared.isNumberMode {
                        ExtraPunctuationMarksKey()
                            .frame(width: 36, height: 34)
                    } else {
                        NumberModeKey()
                            .frame(width: 36, height: 34)
                    }
                    
                    Spacer().frame(width: 12)
                }
                
                ForEach(KeyboardKey.numberAndPunctuationMarks.row.bottomKeys, id: \.self) {
                    KeyboardLetterKey($0, isCapsLocked: false)
                        .frame(width: 36, height: 34)
                }
                
                HStack {
                    Spacer().frame(width: 12)
                    BackspaceKey()
                        .frame(width: 36, height: 34)
                }
            }
            
            HStack(spacing: 4) {
                
                AlphabetModeKey()
                    .frame(width: 36, height: 34)
                EmojiModeKey()
                    .frame(width: 36, height: 34)
                SpaceKey()
                    .frame(width: 154, height: 34)
                DoneKey(inputText: core.inputText, type: type)
                    .frame(width: 74, height: 34)
            }
        }
    }
}

#Preview {
    NumberAndPunctuationMarkKeyboard(type: .addNewTask)
}
