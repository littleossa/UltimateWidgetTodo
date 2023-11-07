//
//  InputForm.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct InputForm: View {
    
    let text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .stroke(lineWidth: 1)
            .foregroundStyle(.keyboardBackground)
            .frame(width: 280, height: 40)
            .overlay {
                
                HStack(spacing: 0) {
                    
                    if text.isEmpty {
                        highlightBar
                            .padding(8)
                    }
                    
                    Text(text.isEmpty ? "Add your task here.." : text)
                        .font(.system(size: 16))
                        .foregroundStyle(text.isEmpty ? Color.placeholderGray : .label)
                        .padding(text.isEmpty ? 0 : 8)
                        .offset(x: text.isEmpty ? -6 : 0)
                    
                    if !text.isEmpty {
                        highlightBar
                            .offset(x: -6)
                    }
                    
                    Spacer()
                }
                .frame(width: 280)
            }
    }
    
    private var highlightBar: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.blue.opacity(0.8))
            .frame(width: 4, height: 26)
    }
}

#Preview {
    VStack {
        InputForm(text: "")
        InputForm(text: "coffeecoffeecoffeecoffeecoffeecoffeecoffeecoffee")
    }
}
