//
//  User.swift
//  Feed
//
//  Created by Kate Kashko on 8.04.2024.
//  Copyright © 2024 SwiftBuddies. All rights reserved.
//

import Foundation

struct User: Identifiable, Hashable, Codable{
    let id: String
    let name: String
    let profileImageUrl: String
}
