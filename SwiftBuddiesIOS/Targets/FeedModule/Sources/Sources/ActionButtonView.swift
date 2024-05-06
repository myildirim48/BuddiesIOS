//
//  ActionButtonView.swift
//  Feed
//
//  Created by Kate Kashko on 15.04.2024.
//  Copyright © 2024 SwiftBuddies. All rights reserved.
//

import SwiftUI

struct ActionButtonView: View {
    
    @State private var isLiked = false
    @State private var showComments = false
    @State private var isSafed = false
    
    var body: some View {
        HStack {
            Spacer()
            ActionButton(systemImageName: isLiked ? "heart.fill" : "heart",
                         label: "Like",
                         isToggled: isLiked,
                         toggledColor: .red) {
                isLiked.toggle()
            }
            Spacer()
            
            ActionButton(systemImageName: "bubble.right",
                         label: "Comment",
                         isToggled: false,
                         toggledColor: .blue) {
                showComments.toggle()
            }
            Spacer()

            ActionButton(systemImageName: isSafed ? "bookmark.fill" : "bookmark",
                         label: "Safe",
                         isToggled: isSafed,
                         toggledColor: .yellow) {
                isSafed.toggle()
            }

            Spacer()
        }
        .padding(.top, 4)
        .padding([.bottom, .horizontal], 10)
        .foregroundColor(.gray)
    }
}

//#Preview {
//    ActionButtonView()
//}
