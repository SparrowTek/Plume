//
//  AppState.swift
//  Plume
//
//  Created by Thomas Rademaker on 3/24/25.
//

import SwiftUI

@Observable
@MainActor
class AppState {
    enum Route {
        case main, onboarding, splash
    }
    
    enum Tab {
        case home, search, notifications, profile
    }
    
    var route: Route = .main
    var tab: Tab = .home
}
