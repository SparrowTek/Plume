//
//  SBProfile.swift
//
//
//  Created by Thomas Rademaker on 9/6/23.
//

import Foundation
import SwiftData
import AtProtocol

@Model
public class SBProfile {
    @Attribute(.unique) public var did: String
    public var handle: String
    public var displayName: String
    public var profileDescription: String
    public var avatar: String
    public var banner: String
    public var followsCount: Int
    public var followersCount: Int
    public var postsCount: Int
    public var indexedAt: Date
    public var viewer: Viewer
    public var labels: [String]
    @Attribute(.externalStorage) public var avatarOnDisk: Data?
    public var session: SBSession?
    
    public init(_ profile: Profile) {
        self.did = profile.did
        self.handle = profile.handle
        self.displayName = profile.displayName
        self.profileDescription = profile.description
        self.avatar = profile.avatar
        self.banner = profile.banner
        self.followsCount = profile.followsCount
        self.followersCount = profile.followersCount
        self.postsCount = profile.postsCount
        self.indexedAt = profile.indexedAt
        self.viewer = profile.viewer
        self.labels = profile.labels
    }
    
    public init(did: String, handle: String, displayName: String, profileDescription: String, avatar: String, banner: String, followsCount: Int, followersCount: Int, postsCount: Int, indexedAt: Date, viewer: Viewer, labels: [String]) {
        self.did = did
        self.handle = handle
        self.displayName = displayName
        self.profileDescription = profileDescription
        self.avatar = avatar
        self.banner = banner
        self.followsCount = followsCount
        self.followersCount = followersCount
        self.postsCount = postsCount
        self.indexedAt = indexedAt
        self.viewer = viewer
        self.labels = labels
    }
}
