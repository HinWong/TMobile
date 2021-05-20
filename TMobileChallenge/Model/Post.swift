//
//  Post.swift
//  TMobileChallenge
//
//  Created by Hin Wong on 5/20/21.
//

import Foundation

struct Reddit: Codable {
    let data: Data
}

struct Data: Codable {
    let children: [Post]
    let after: String?
}

struct Post: Codable {
    let data: PostInfo
}

struct PostInfo: Codable {
    let title: String
    let thumbnail: String
    let thumbnail_height: Int?
    let thumbnail_width: Int?
    let score: Int
    let num_comments: Int
}
