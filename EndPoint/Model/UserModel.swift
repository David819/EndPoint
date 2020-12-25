//
//  UserModel.swift
//  EndPoint
//
//  Created by Rachel on 2020/12/25.
//

import Foundation

protocol PropertyHshable {}
extension PropertyHshable {
    func get() -> [[String: String]] {
        let mirror = Mirror(reflecting: self)
        var result:[[String: String]] = []
        for child in mirror.children {
            result.append(["key": child.label ?? "Unknown key", "value": "\(child.value)"])
        }
        return result
    }
}

struct UserModel: Codable, PropertyHshable {
//    var timeInterval: Double
    var login: String
    var id: Int64
    var node_id: String
    var avatar_url: String
    var gravatar_id: String
    var url: String
    var html_url: String
    var followers_url: String
    var following_url: String
    var gists_url: String
    var starred_url: String
    var subscriptions_url: String
    var organizations_url: String
    var repos_url: String
    var events_url: String
    var received_events_url: String
    var type: String
    var site_admin: Bool
    var name: String
    var company: String
    var blog: String
    var location: String
    var email: String
    var hireable: String
    var bio: String
    var twitter_username: String
    var public_repos: Int64
    var public_gists: Int64
    var followers: Int64
    var following: Int64
    var created_at: String
    var updated_at: String
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case node_id = "node_id"
        case avatar_url = "avatar_url"
        case gravatar_id = "gravatar_id"
        case url = "url"
        case html_url = "html_url"
        case followers_url = "followers_url"
        case following_url = "following_url"
        case gists_url = "gists_url"
        case starred_url = "starred_url"
        case subscriptions_url = "subscriptions_url"
        case organizations_url = "organizations_url"
        case repos_url = "repos_url"
        case events_url = "events_url"
        case received_events_url = "received_events_url"
        case type = "type"
        case site_admin = "site_admin"
        case name = "name"
        case company = "company"
        case blog = "blog"
        case location = "location"
        case email = "email"
        case hireable = "hireable"
        case bio = "bio"
        case twitter_username = "twitter_username"
        case public_repos = "public_repos"
        case public_gists = "public_gists"
        case followers = "followers"
        case following = "following"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.login = try container.decodeIfPresent(String.self, forKey: .login) ?? "Unknown"
        
        self.id = try container.decodeIfPresent(Int64.self, forKey: .id) ?? 0
        
        self.node_id = try container.decodeIfPresent(String.self, forKey: .node_id) ?? "Unknown"
        self.avatar_url = try container.decodeIfPresent(String.self, forKey: .avatar_url) ?? "Unknown"
        self.gravatar_id = try container.decodeIfPresent(String.self, forKey: .gravatar_id) ?? "Unknown"
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? "Unknown"
        self.html_url = try container.decodeIfPresent(String.self, forKey: .html_url) ?? "Unknown"
        self.followers_url = try container.decodeIfPresent(String.self, forKey: .followers_url) ?? "Unknown"
        self.following_url = try container.decodeIfPresent(String.self, forKey: .following_url) ?? "Unknown"
        self.gists_url = try container.decodeIfPresent(String.self, forKey: .gists_url) ?? "Unknown"
        self.starred_url = try container.decodeIfPresent(String.self, forKey: .starred_url) ?? "Unknown"
        self.subscriptions_url = try container.decodeIfPresent(String.self, forKey: .subscriptions_url) ?? "Unknown"
        self.organizations_url = try container.decodeIfPresent(String.self, forKey: .organizations_url) ?? "Unknown"
        self.repos_url = try container.decodeIfPresent(String.self, forKey: .repos_url) ?? "Unknown"
        self.events_url = try container.decodeIfPresent(String.self, forKey: .events_url) ?? "Unknown"
        self.received_events_url = try container.decodeIfPresent(String.self, forKey: .received_events_url) ?? "Unknown"
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? "Unknown"
        
        self.site_admin = try container.decodeIfPresent(Bool.self, forKey: .site_admin) ?? false
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? "Unknown"
        self.company = try container.decodeIfPresent(String.self, forKey: .company) ?? "Unknown"
        self.blog = try container.decodeIfPresent(String.self, forKey: .blog) ?? "Unknown"
        self.location = try container.decodeIfPresent(String.self, forKey: .location) ?? "Unknown"
        self.email = try container.decodeIfPresent(String.self, forKey: .email) ?? "Unknown"
        self.hireable = try container.decodeIfPresent(String.self, forKey: .hireable) ?? "Unknown"
        self.bio = try container.decodeIfPresent(String.self, forKey: .bio) ?? "Unknown"
        self.twitter_username = try container.decodeIfPresent(String.self, forKey: .twitter_username) ?? "Unknown"
        
        self.public_repos = try container.decodeIfPresent(Int64.self, forKey: .public_repos) ?? 0
        self.public_gists = try container.decodeIfPresent(Int64.self, forKey: .public_gists) ?? 0
        self.followers = try container.decodeIfPresent(Int64.self, forKey: .followers) ?? 0
        self.following = try container.decodeIfPresent(Int64.self, forKey: .following) ?? 0
        
        self.created_at = try container.decodeIfPresent(String.self, forKey: .created_at) ?? "Unknown"
        self.updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at) ?? "Unknown"
    }
}



