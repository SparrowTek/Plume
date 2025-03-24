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
        case main
        case onboarding
        case splash
    }
    
    var route: Route = .main
}
