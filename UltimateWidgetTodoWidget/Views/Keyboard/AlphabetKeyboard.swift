//
//  AlphabetKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct AlphabetKeyboard: View {
    
    let type: EditTaskType
    
    var body: some View {
        
        VStack(spacing: 10) {
            HStack(spacing: 6) {
                ForEach(KeyboardInputRepository.topRowAlphabets, id: \.self) {
                    KeyboardLetterKey($0)
                        .frame(width: 26, height: 34)
                }
            }
            
            HStack(spacing: 6) {
                ForEach(KeyboardInputRepository.centerRowAlphabets, id: \.self) {
                    KeyboardLetterKey($0)
                        .frame(width: 26, height: 34)
                }
            }
            
            HStack(spacing: 6) {
                
                HStack {
                    CapsLockKey()
                        .frame(width: 36, height: 34)
                    Spacer().frame(width: 6)
                }
                
                ForEach(KeyboardInputRepository.bottomRowAlphabets, id: \.self) {
                    KeyboardLetterKey($0)
                        .frame(width: 26, height: 34)
                }
                
                HStack {
                    Spacer().frame(width: 6)
                    BackspaceKey()
                        .frame(width: 36, height: 34)
                }
            }
            
            HStack(spacing: 4) {
                
                NumberModeKey()
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
