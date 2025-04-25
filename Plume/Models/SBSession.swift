//
//  SBSession.swift
//  Plume
//
//  Created by Thomas Rademaker on 9/1/23.
//

import SwiftData
import SwiftUI
import Vault
import AtProtocol
/*
public enum ACSessionSchemaV1: VersionedSchema {
    public static var versionIdentifier = Schema.Version(1, 0, 0)
    
    public static var models: [any PersistentModel.Type] {
        [ACSession.self]
    }
    
//    @Model
//    public class ACSession {
//        @Attribute(.unique) public var did: String
//        public var handle: String
//        public var email: String?
//        
////        @Relationship(deleteRule: .cascade, inverse: \SBProfile.session) public var profile: SBProfile?
////        @Relationship(deleteRule: .cascade, inverse: \ACPreferences.session) public var preferences: ACPreferences?
////        @Relationship(deleteRule: .cascade, inverse: \ACTimeline.session) public var timeline: ACTimeline?
//        
//        init(did: String, handle: String, email: String? = nil/*, profile: SBProfile? = nil, preferences: ACPreferences? = nil, timeline: ACTimeline? = nil*/) {
//            self.did = did
//            self.handle = handle
//            self.email = email
////            self.profile = profile
////            self.preferences = preferences
////            self.timeline = timeline
//        }
//    }
}*/

@Model
public class SBSession {
    @Attribute(.unique) public var did: String
    public var handle: String
    public var email: String?
    
//        @Relationship(deleteRule: .cascade, inverse: \SBProfile.session) public var profile: SBProfile?
//        @Relationship(deleteRule: .cascade, inverse: \ACPreferences.session) public var preferences: ACPreferences?
//        @Relationship(deleteRule: .cascade, inverse: \ACTimeline.session) public var timeline: ACTimeline?
    
    init(did: String, handle: String, email: String? = nil/*, profile: SBProfile? = nil, preferences: ACPreferences? = nil, timeline: ACTimeline? = nil*/) {
        self.did = did
        self.handle = handle
        self.email = email
//            self.profile = profile
//            self.preferences = preferences
//            self.timeline = timeline
    }
}
/*
extension SBSession {
    @discardableResult
    public static func update(did: String, handle: String, email: String?, accessJwt: String?, refreshJwt: String?) -> PersistentIdentifier? {
        do {
            let context = ModelContext(ACModel.shared.container)
            context.autosaveEnabled = false
            guard let state = try context.fetch(FetchDescriptor<ACState>()).first else { return nil }
            state.currentSessionDid = did
            
            let acSession: SBSession
            
            if let storedSession = try context.fetch(FetchDescriptor<SBSession>(predicate: #Predicate { $0.did == did })).first {
                acSession = storedSession
            } else {
                acSession = SBSession(did: did, handle: handle, email: email)
                context.insert(acSession)
            }
            
            acSession.handle = handle
            acSession.email = email
            try? context.save()
            
            if let accessJwt = accessJwt, let refreshJwt = refreshJwt {
                try Vault.savePrivateKey(accessJwt, keychainConfiguration: KeychainConfiguration(serviceName: Constants.serviceName, accessGroup: nil, accountName: "\(Constants.accessJWT)\(did)"))
                try Vault.savePrivateKey(refreshJwt, keychainConfiguration: KeychainConfiguration(serviceName: Constants.serviceName, accessGroup: nil, accountName: "\(Constants.refreshJWT)\(did)"))
                
                AtProtocol.updateTokens(access: accessJwt, refresh: refreshJwt)
            }
            
            return acSession.id
        } catch {
            return nil
        }
    }
    
    public static var current: SBSession? {
        let context = ModelContext(ACModel.shared.container)
        let did = ACState.current.currentSessionDid
        guard let session = try? context.fetch(FetchDescriptor<ACSession>(predicate: #Predicate { $0.did == did })).first else { return nil }
        return session
    }
}*/
