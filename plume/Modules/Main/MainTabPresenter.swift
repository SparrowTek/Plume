//
//  MainTabPresenter.swift
//  Plume
//
//  Created by Thomas Rademaker on 3/24/25.
//

import SwiftUI
import SwiftData

struct MainTabPresenter: View {
    @Environment(AppState.self) private var state
    @State private var triggerSensoryFeedback = false
    
    var body: some View {
        @Bindable var state = state
        
        ZStack {
            HomePresenter()
                .environment(state.homeState)
                .opacity(state.tab == .home ? 1 : 0)
            
            Text("SEARCH")
                .opacity(state.tab == .search ? 1 : 0)
            
            Text("NOTIFICATIONS")
                .opacity(state.tab == .notifications ? 1 : 0)
            
            Text("PROFILE")
                .opacity(state.tab == .profile ? 1 : 0)
        }
        .animation(.easeInOut, value: state.tab)
        .onChange(of: state.tab) { triggerSensoryFeedback.toggle() }
        .sensoryFeedback(.selection, trigger: triggerSensoryFeedback)
        .overlay(PlumeTabBar(), alignment: .bottom)
    }
}

fileprivate struct PlumeTabBar: View {
    @Environment(AppState.self) private var state
    
    var body: some View {
        HStack{
            createTab(for: .home)
            createTab(for: .search)
            createTab(for: .notifications)
            createTab(for: .profile)
        }
        .background(Color.primaryWhite)
    }
    
    private func createTab(for tab: AppState.Tab) -> some View {
        Button(action: {
            withAnimation { state.tab = tab }
        }) {
            switch tab {
            case .home:
                ZStack {
                    
                    // TODO: this dot is only if unread
                    VStack {
                        Spacer()
                        Circle()
                            .fill(.accent)
                            .frame(width: 6)
                            .opacity(state.tab == tab ? 0 : 1)
                    }
                    
                    Image(systemName: "house")
                }
            case .search:
                Image(systemName: "magnifyingglass")
            case .notifications:
                Image(systemName: "bell")
            case .profile:
                ZStack {
                    Circle()
                        .frame(width: 32)
                    
                        // TODO: get this working with avatarOnDisk
//                    CommonImage(image: .data(profiles.first?.avatarOnDisk, sfSymbol: "person.fill"))
                    
                    PlumeImage(image: .url(url: "https://pbs.twimg.com/profile_images/1537799382677995521/BQSmUtMK_400x400.jpg", placeholder: .sfSymbol("person.fill")))
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                }
            }
        }
        .font(.title2)
        .symbolVariant(state.tab == tab ? .fill : .none)
        .foregroundStyle(state.tab == tab ? .accent : .primaryBlack)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .padding(.bottom)
        .animation(.default, value: state.tab)
    }
}

#if DEBUG
#Preview {
    MainTabPresenter()
        .environment(AppState())
}
#endif
