//
//  WidgetTodoErrorView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct WidgetTodoErrorView<Content: View>: View {
    
    init(error: WidgetError, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.error = error
    }
    
    let content: Content
    let error: WidgetError
    
    var body: some View {
        
        ZStack {
            content
            
            Color.black
            
            Rectangle()
                .fill(.gray)
            
            VStack {
                Text(error.info.title)
                Text(error.info.message)
            }
        }
    }
}

extension View {
    
    @ViewBuilder
    func alert(widgetError: WidgetError?) -> some View {
        if let widgetError {
            WidgetTodoErrorView(error: widgetError) {
                self
            }
        } else {
            self
        }
    }
}

#Preview {
    WidgetTodoErrorView(error: .taskNameLimitExceeded) {
        Text("content")
    }
}
