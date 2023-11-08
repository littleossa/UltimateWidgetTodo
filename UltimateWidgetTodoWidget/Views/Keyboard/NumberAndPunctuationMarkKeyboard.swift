//
//  NumberAndPunctuationMarkKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct NumberAndPunctuationMarkKeyboard: View {
    
    let type: EditTaskType
    
    private var topRowCharacters: [String] {
        if WidgetTodoCore.shared.isNumberMode {
            return KeyboardInputRepository.topRowNumbers
        } else {
            return KeyboardInputRepository.topRowExtraPunctuationMarks
        }
    }
    
    private var centerRowCharacters: [String] {
        if WidgetTodoCore.shared.isNumberMode {
            return KeyboardInputRepository.centerRowPunctuationMarks
        } else {
            return KeyboardInputRepository.centerRowExtraPunctuationMarks
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
                
                ForEach(KeyboardInputRepository.bottomRowPunctuationMarks, id: \.self) {
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
                DoneKey(type: type)
                    .frame(width: 74, height: 34)
            }
        }
    }
}

#Preview {
    NumberAndPunctuationMarkKeyboard(type: .addNewTask)
}
