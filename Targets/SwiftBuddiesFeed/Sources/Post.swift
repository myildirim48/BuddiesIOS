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
    let content: String
    let imageUrl: String
}
