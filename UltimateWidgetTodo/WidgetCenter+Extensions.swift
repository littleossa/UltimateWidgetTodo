//
//  WidgetCenter+Extensions.swift
//  UltimateWidgetTodo
//
//

import WidgetKit

extension WidgetCenter {
    
    func getInstalledWidgetInfo() async throws -> [WidgetInfo] {
        try await withCheckedThrowingContinuation { continuation in
            self.getCurrentConfigurations { result in
                switch result {
                case .success(let info):
                    continuation.resume(returning: info)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
