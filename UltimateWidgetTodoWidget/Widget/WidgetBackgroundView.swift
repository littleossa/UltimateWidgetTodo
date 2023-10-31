//
//  WidgetBackgroundView.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

struct WidgetBackgroundView: View {
    
    let topBarColor = LinearGradient(colors: [.indigo, .blue, .cyan, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(topBarColor)
                .frame(height: 60)
            
            Spacer()
        }
    }
}

#Preview {
    WidgetBackgroundView()
}
