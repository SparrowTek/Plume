//
//  ProfilePresenter.swift
//  Plume
//
//  Created by Thomas Rademaker on 8/27/23.
//

import SwiftUI
import SwiftData

struct ProfilePresenter: View {
    var body: some View {
        ProfileView()
    }
}

struct ProfileView: View {
    @AppStorage(Constants.UserDefaults.currentSessionDid) private var currentSessionDid: String?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ProfileHeaderView(currentSessionDid: currentSessionDid)
                TimelineListView(timelines: [])
            }
        }
        .ignoresSafeArea()
        .navBar()
        .fullScreenColorView()
        .task { await getProfile() }
    }
    
    private func getProfile() async {
        
    }
}

fileprivate struct ProfileHeaderView: View {
    var currentSessionDid: String?
    @Query private var profiles: [SBProfile]
    
    init(currentSessionDid: String?) {
        _profiles = Query(filter: #Predicate<SBProfile> { $0.did == currentSessionDid ?? ""})
    }
    
    private var profileURL: String? {
        profiles.first?.banner
    }
    
    var body: some View {
        CommonImage(image: .url(url: profileURL, sfSymbol: "photo"))
            .frame(maxWidth: .infinity)
            .frame(height: 200)
    }
}

#if DEBUG
#Preview(traits: .sampleProfile, .sampleTimeline, .sampleSession) {
    @Previewable @AppStorage(Constants.UserDefaults.currentSessionDid) var currentSessionDid: String?
    
    ProfilePresenter()
        .environment(HomeState(parentState: .init()))
        .onAppear { currentSessionDid = "did:plc:ucct3fwwarzd7rety6nzq4cc" }
}
#endif
