//
//  FeedViewCell.swift
//  Feed
//
//  Created by Kate Kashko on 8.04.2024.
//  Copyright © 2024 SwiftBuddies. All rights reserved.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    
    var body: some View{
        
        VStack{
            FeedCellHeaderView(post: Post.MOCK_POSTS[0])
            FeedCellContentView(post: Post.MOCK_POSTS[1])
            FeedCellCountersView(post: Post.MOCK_POSTS[2])
            
            Divider()
            
            ActionButtonView()
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
