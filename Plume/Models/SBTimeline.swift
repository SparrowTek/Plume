import SwiftData
import AtProtocol
//
//public enum ACTimelineSchemaV1: VersionedSchema {
//    public static var versionIdentifier = Schema.Version(1, 0, 0)
//    
//    public static var models: [any PersistentModel.Type] {
//        [ACTimeline.self]
//    }
//    
//    @Model
//    public class ACTimeline {
//        public var feed: [TimelineItem]
//        public var cursor: String
//        public var session: SBSession?
//        
//        init(feed: [TimelineItem], cursor: String, session: SBSession?) {
//            self.feed = feed
//            self.cursor = cursor
//            self.session = session
//        }
//    }
//}

@Model
class SBTimeline {
    var feed: [TimelineItem]
    var cursor: String
    var session: SBSession?
    
    init(feed: [TimelineItem], cursor: String, session: SBSession? = nil) {
        self.feed = feed
        self.cursor = cursor
        self.session = session
    }
}
