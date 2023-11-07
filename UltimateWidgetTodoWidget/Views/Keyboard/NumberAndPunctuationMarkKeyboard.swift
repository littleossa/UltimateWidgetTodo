//
//  NumberAndPunctuationMarkKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct NumberAndPunctuationMarkKeyboard: View {
    
    let taskType: EditTaskType
    
    private var topRowCharacters: [String] {
        if KeyboardInputManager.shared.isNumberMode {
            return KeyboardInputManager.topRowNumbers
        } else {
            return KeyboardInputManager.topRowExtraPunctuationMarks
        }
    }
    
    private var centerRowCharacters: [String] {
        if KeyboardInputManager.shared.isNumberMode {
            return KeyboardInputManager.centerRowPunctuationMarks
        } else {
            return KeyboardInputManager.centerRowExtraPunctuationMarks
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
                    
                    if KeyboardInputManager.shared.isNumberMode {
                        ExtraPunctuationMarksKey()
                            .frame(width: 36, height: 34)
                    } else {
                        NumberModeKey()
                            .frame(width: 36, height: 34)
                    }
                    
                    Spacer().frame(width: 12)
                }
                
                ForEach(KeyboardInputManager.bottomRowPunctuationMarks, id: \.self) {
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
                DoneKey()
                    .frame(width: 74, height: 34)
            }
        }
    }
}

#Preview {
    NumberAndPunctuationMarkKeyboard(taskType: .addNewTask)
}
