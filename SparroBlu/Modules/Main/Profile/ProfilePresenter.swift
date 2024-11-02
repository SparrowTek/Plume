//
//  ProfilePresenter.swift
//  SparroBlu
//
//  Created by Thomas Rademaker on 8/27/23.
//

import SwiftUI

struct ProfilePresenter: View {
    var body: some View {
        ProfileView()
    }
}

struct ProfileView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            ProfileHeaderView()
            TimelineListView(timelines: [])
        }
        .navBar()
        .fullScreenColorView()
    }
    
    private func getProfile() {
        
    }
}

fileprivate struct ProfileHeaderView: View {
    var body: some View {
        Text("header")
            .ignoresSafeArea()
    }
}

#if DEBUG
#Preview(traits: .sampleProfile, .sampleTimeline, .sampleSession) {
    ProfilePresenter()
        .environment(HomeState(parentState: .init()))
}
#endif
