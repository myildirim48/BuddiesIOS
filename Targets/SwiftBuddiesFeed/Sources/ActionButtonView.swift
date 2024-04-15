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

            ActionButton(action: {
                isLiked.toggle()
                print("like post")
            }, imageName: isLiked ? "heart.fill" : "heart", label: "Like", isToggled: isLiked, toggledColor: .red)

            Spacer()

            ActionButton(action: {
                showComments.toggle()
            }, imageName: "bubble.right", label: "Comment", isToggled: false, toggledColor: .blue)
            .sheet(isPresented: $showComments) {
                CommentView()
                    .presentationDetents([.medium, .large])
            }

            Spacer()

            ActionButton(action: {
                isSafed.toggle()
                print("Safe")
            }, imageName: isSafed ? "bookmark.fill" : "bookmark", label: "Safe", isToggled: isSafed, toggledColor: .yellow)

            Spacer()
        }
        .padding(.top, 4)
        .padding([.bottom, .horizontal], 10)
        .foregroundColor(.gray)
    }
}

#Preview {
    ActionButtonView()
}
