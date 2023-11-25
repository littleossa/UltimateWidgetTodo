//
//  UltimateWidgetTodoApp.swift
//  UltimateWidgetTodo
//
//

import SwiftUI
import WidgetKit

@main
struct UltimateWidgetTodoApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    @State private var widgetInstallState: WidgetInstallState = .checking
    
    var body: some Scene {
        WindowGroup {
            switch widgetInstallState {
            case .checking:
                EmptyView()
            case .installed:
                AppTitleView(installState: widgetInstallState)
            case .error, .notInstall:
                OnboardingView()
            }
        }
        .onChange(of: scenePhase) { _, newValue in
            guard newValue == .active
            else { return }
            
            Task {
                await checkWidgetInstallState()
            }
        }
    }
    
    private func checkWidgetInstallState() async {
        widgetInstallState = .checking
        
        do {
            try await Task.sleep(for: .seconds(0.05))
            let info = try await WidgetCenter.shared.getInstalledWidgetInfo()
            
            if info.isEmpty {
                widgetInstallState = .notInstall
                return
            }
            widgetInstallState = .installed
            try await Task.sleep(for: .seconds(0.75))
            await UIControl.backToHomeScreenOfDevice()
            try await Task.sleep(for: .seconds(0.2))
            exit(0)
            
        } catch {
            widgetInstallState = .error
        }
    }
}

enum WidgetInstallState {
    case checking
    case error
    case installed
    case notInstall
}
