//
//  ActionButton.swift
//  Feed
//
//  Created by Kate Kashko on 15.04.2024.
//  Copyright © 2024 SwiftBuddies. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    let action: () -> Void
    let imageName: String
    let label: String
    let isToggled: Bool
    let toggledColor: Color

    var body: some View {
        Button(action: action) {
            VStack(spacing: 2) {
                Image(systemName: imageName)
                    .imageScale(.medium)
                    .foregroundColor(isToggled ? toggledColor : .primary)

                Text(label)
                    .font(.caption2)
                    .foregroundColor(isToggled ? toggledColor : .primary)
            }
        }
    }
}
