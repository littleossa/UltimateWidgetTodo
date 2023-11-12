//
//  UIControl+Extensions.swift
//  UltimateWidgetTodo
//
//

import UIKit

extension UIControl {
    
    static func backToHomeScreenOfDevice() {
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    }
}
