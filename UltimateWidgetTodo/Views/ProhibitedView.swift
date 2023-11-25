//
//  ProhibitedView.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

struct ProhibitedView: View {
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Text("Ultimate\nWidgetTodo")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(LinearGradient.ultimateBlue)
            
            Text("Launching the main app is prohibited.")
                .font(.headline)
                .fontWeight(.semibold)
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    ProhibitedView()
}
