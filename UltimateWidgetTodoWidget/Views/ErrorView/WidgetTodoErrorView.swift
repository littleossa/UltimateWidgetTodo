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
        
        Color.black.opacity(0.7)
            .overlay {
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(.keyboardBackground)
                    .frame(width: 284, height: 284)
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
                            
                            VStack(spacing: 0) {
                                
                                Divider()
                                    .background(.keyShadow)
                                
                                Spacer().frame(height: 4)
                                
                                ErrorOKButton()
                                    .frame(height: 60)
                                
                                Spacer().frame(height: 4)
                            }
                        }
                        .foregroundStyle(Color.label)
                        .multilineTextAlignment(.center)
                    }
            }
            .background(content)
            .transition(.opacity)
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
    WidgetTodoErrorView(error: .todoItemNameLimitExceeded) {
        Text("content")
    }
}
