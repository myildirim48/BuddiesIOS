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
    
    var body: some View {
        
        VStack{
     // MARK: - image + username + date
            HStack{
                if let user = post.user{
                    Image(user.profileImageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 43, height: 43)
                        .clipShape(Circle())
                    
                    VStack{
                        Text(user.name)
                            .font(.body)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .foregroundColor(.mainGray)
                        
                        Spacer()
                        
                        Text("01.01.2025 at 09.00 a.m.") //need add logic
                            .font(.caption2)
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                    }
                    .frame(maxHeight: 43)
                }
                Spacer()
            }
            .padding(.top, 10)
            .padding(.horizontal, 10)

// MARK: - post content, location
            Text(post.content)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .padding(.horizontal, 10)
                .padding(.top, 4)
            
// MARK: - post image
            if let imageUrl = post.imageUrl, !imageUrl.isEmpty {
                Image(imageUrl)
                    .resizable()
                    .scaledToFit()
            }
            
// MARK: - like and comments counters
            HStack{
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                
                Text("\(post.likeCount)")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("\(post.commentsCount) comments")
                    .font(.footnote)
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .trailing)

            }
            .padding(.top, 8)
            .padding(.horizontal, 10)
            .foregroundColor(.mainGray)
            
            Divider()
            
// MARK: - action buttons
            HStack{
                Spacer()
                VStack{
                    Button{
                        print("like post")
                    } label: {
                        Image(systemName: "heart") // need add "if" statements to change color if already liked post
                            .imageScale(.medium)
                    }
                    Text("Like")
                        .font(.caption2)
                }
                Spacer()
                VStack{
                    Button{
                        print("Comment on  post")
                    } label: {
                        Image(systemName: "bubble.right")
                            .imageScale(.medium)
                    }
                    Text("Comment")
                        .font(.caption2)
                }
                Spacer()
                VStack{
                    Button{
                        print("Share post")
                    } label: {
                        Image(systemName: "paperplane")
                            .imageScale(.medium)
                    }
                    Text("Share")
                        .font(.caption2)
                }
                Spacer()
            }
            .padding(.top, 4)
            .padding([.bottom, .horizontal], 10)
            .foregroundColor(.mainGray)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
