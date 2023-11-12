//
//  ContentView.swift
//  UltimateWidgetTodo
//
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @State private var widgetInstallState: WidgetInstallState = .checking

    var body: some View {
        ZStack {
            switch widgetInstallState {
            case .checking, .installed:
                AppTitleView(installState: widgetInstallState)
            case .error, .notInstall:
                OnboardingView()
            }
        }
        .task {
            await checkInstalledWidget()
        }
    }
    
    private func checkInstalledWidget() async {
        
        widgetInstallState = .checking
        
        do {
            let info = try await WidgetCenter.shared.getInstalledWidgetInfo()
            
            if info.isEmpty {
                widgetInstallState = .notInstall
                return
            }
            widgetInstallState = .installed
            try await Task.sleep(for: .seconds(1.5))
            await UIControl.backToHomeScreenOfDevice()
            try await Task.sleep(for: .seconds(0.2))
            exit(0)
            
        } catch {
            widgetInstallState = .error
        }
    }
}

#Preview {
    ContentView()
}

enum WidgetInstallState {
    case checking
    case error
    case installed
    case notInstall
}
