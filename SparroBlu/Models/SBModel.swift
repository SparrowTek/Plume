//
//  SBModel.swift
//  SparroBlu
//
//  Created by Thomas Rademaker on 9/1/23.
//

import SwiftUI
import SwiftData

//public typealias ACFeed = ACFeedSchemaV1.ACFeed
//public typealias ACPreferences = ACPreferencesSchemaV1.ACPreferences
//public typealias SBProfile = ACProfileSchemaV1.SBProfile
//public typealias SBSession = ACSessionSchemaV1.SBSession
//public typealias ACTimeline = ACTimelineSchemaV1.ACTimeline
//public typealias ACModel = ACModelSchemaV1.ACModel

//public enum ACModelSchemaV1: VersionedSchema {
//    public static var versionIdentifier = Schema.Version(1, 0, 0)
//    
//    public static var models: [any PersistentModel.Type] {
//        [SBSession.self]
//    }
//    
//    @Model
//    public class ACModel {
//        public init() {}
//    }
//}

//public extension ACModel {
//    static let schema = SwiftData.Schema([
////        ACModel.self,
////        ACFeed.self,
////        ACPreferences.self,
////        SBProfile.self,
//        SBSession.self,
////        ACTimeline.self,
//    ])
//}

//struct ACModelViewModifier: ViewModifier {
//    @Environment(\.modelContext) private var modelContext
//    
//    func body(content: Content) -> some View {
//        content.onAppear {
//            DataGeneration.generateAllData(modelContext: modelContext)
//        }
//    }
//}

struct SparroBluDataContainerViewModifier: ViewModifier {
    let container: ModelContainer
    let schema = Schema([
        SBSession.self,
        SBTimeline.self,
        SBProfile.self,
//        ACFeed.self,
    ])
    
    init(inMemory: Bool) {
        do {
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: inMemory)
            container = try ModelContainer(for: schema, configurations: modelConfiguration)
        } catch {
            fatalError("Failed to create ModelContainer")
        }
    }
    
    func body(content: Content) -> some View {
        content
            .modelContainer(container)
    }
}

public extension View {
    func setupModel(inMemory: Bool = SBModelOptions.inMemoryPersistence) -> some View {
        modifier(SparroBluDataContainerViewModifier(inMemory: inMemory))
    }
}
