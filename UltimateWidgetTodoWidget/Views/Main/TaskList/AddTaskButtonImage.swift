//
//  AddTaskButtonImage.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

struct AddTaskButtonImage: View {
    var body: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundStyle(.widgetBackground)
            Image(systemName: "plus.circle.fill")
                .resizable()
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    AddTaskButtonImage()
        .frame(width: 44, height: 44)
}
