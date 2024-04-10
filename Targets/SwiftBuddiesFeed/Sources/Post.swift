//
//  Post.swift
//  Feed
//
//  Created by Kate Kashko on 8.04.2024.
//  Copyright © 2024 SwiftBuddies. All rights reserved.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let authorId: String
    let likeCount: Int
    let commentsCount: Int
    let content: String
    let imageUrl: String?
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: NSUUID().uuidString,
            authorId: NSUUID().uuidString,
            likeCount: 98,
            commentsCount: 10,
            content: "Lets do it...",
            imageUrl: "example",
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            authorId: NSUUID().uuidString,
            likeCount: 123,
            commentsCount: 15,
            content: "Hello everyone",
            imageUrl: "",
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            authorId: NSUUID().uuidString,
            likeCount: 120,
            commentsCount: 20,
            content: "Our first steps in project...",
            imageUrl: "logo",
            user: User.MOCK_USERS[0]
        )
        
    ]
}
