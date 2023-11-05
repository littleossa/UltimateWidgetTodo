//
//  TodoListRow.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct TodoListRow: View {
    
    let item: TodoItem
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                TodoCompleteButton(item: item)
                
                Text(item.name)
                    .font(.system(size: 16))
                
                Spacer()
            }
            .padding(.vertical, 8)
            
            Line()
                .stroke(style: .init(dash: [3, 3]))
                .foregroundColor(.gray)
                .frame(height: 0.5)
                .padding(.leading, 32)
        }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
