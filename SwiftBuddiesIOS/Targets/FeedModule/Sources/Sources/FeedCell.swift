//
//  FeedViewCell.swift
//  Feed
//
//  Created by Kate Kashko on 8.04.2024.
//  Copyright © 2024 SwiftBuddies. All rights reserved.
//

import SwiftUI

struct FeedCell: View {
    let post: PostModel
    
    var body: some View {
        
        VStack {
            FeedCellHeaderView(post: PostModel.MockPosts[0])
            FeedCellContentView(post: PostModel.MockPosts[1])
            FeedCellCountersView(post: PostModel.MockPosts[2])
            
            Divider()
            
            ActionButtonView()
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    FeedCell(post: PostModel.MockPosts[0])
}
