//
//  AppTitleView.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

struct AppTitleView: View {
    
    let installState: WidgetInstallState
    
    private var subTitle: LocalizedStringKey {
        switch installState {
        case .checking:
            return "Enriching Your Widget Life."
        case .installed:
            return "Launching the main app is prohibited."
        case .error, .notInstall:
            return ""
        }
    }
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Text("Ultimate\nWidgetTodo")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(LinearGradient.ultimateBlue)
            
                Text(subTitle)
                    .font(.headline)
                    .fontWeight(.semibold)
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    AppTitleView(installState: .checking)
}

#Preview {
    AppTitleView(installState: .installed)
}
