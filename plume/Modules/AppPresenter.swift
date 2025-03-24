//
//  AppPresenter.swift
//  Plume
//
//  Created by Thomas Rademaker on 3/24/25.
//

import SwiftUI

struct AppPresenter: View {
    @Environment(AppState.self) private var state
    
    var body: some View {
        @Bindable var state = state
        switch state.route {
        case .onboarding:
            Text("ONBOARDING")
        case .splash:
            Text("SPLASH")
        case .main:
            Text("PLUME")
        }
    }
}

#Preview {
    AppPresenter()
        .environment(AppState())
}
