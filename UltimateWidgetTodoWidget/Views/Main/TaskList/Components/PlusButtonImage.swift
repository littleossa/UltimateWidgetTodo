//
//  PlusButtonImage.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

struct PlusButtonImage: View {
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
    PlusButtonImage()
        .frame(width: 44, height: 44)
}
