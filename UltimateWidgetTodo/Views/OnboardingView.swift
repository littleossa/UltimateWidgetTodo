//
//  OnboardingView.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        
        VStack(spacing: 16) {
            Text("Ultimate\nWidgetTodo")
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(LinearGradient.ultimateBlue)
            
            Group {
                Text("The app specialized in managing Todo on the widget.")
                
                Text("To use this app, you need to add the widget to your home screen.")
            }
            .foregroundColor(Color(uiColor: .darkGray))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 16)
            
            VStack(spacing: 8) {
                
                Text("How to Add Widget")
                    .font(.title)
                    .bold()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("1. Long press on an empty space on your home screen.")

                    Text("2. Tap the + button that appears in the top.")

                    Text("3. Select Add Widget when the widget selection screen appears.")
                    Text("4. Place the widget anywhere you like on your home screen.")
                }
                .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
                .frame(height: 40)
            
            Button("Back to Home Screen") {
                
                UIControl.backToHomeScreenOfDevice()
                Task {
                    try await Task.sleep(for: .seconds(0.2))
                    exit(0)
                }
            }
            .foregroundColor(.white)
            .bold()
            .padding(24)
            .background {
                RoundedRectangle(cornerRadius: 36)
                    .foregroundColor(.accentColor)
            }
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
