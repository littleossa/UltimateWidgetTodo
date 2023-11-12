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
        
        RoundedRectangle(cornerRadius: 8)
            .fill(.keyboardBackground)
            .frame(width: 300, height: 300)
            .overlay {
                VStack(spacing: 8){
                    
                    Spacer().frame(height: 8)
                    
                    Text(error.info.title)
                        .font(.system(size: 26))
                        .bold()
                        .padding(.horizontal)
                    Text(error.info.message)
                        .font(.system(size: 18))
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    VStack {
                        
                        Divider()
                            .background(.keyShadow)
                        
                        Spacer().frame(height: 16)
                        
                        Text("OK")
                            .font(.system(size: 26))
                            .bold()
                            .foregroundStyle(.blue)
                        
                        Spacer().frame(height: 16)

                    }
                }
                .foregroundStyle(Color.label)
                .multilineTextAlignment(.center)
            }
            .containerBackground(for: .widget) {
                Color.black.opacity(0.7)
                    .background {
                        content
                            .padding()
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
