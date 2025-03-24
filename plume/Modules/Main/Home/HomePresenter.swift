//
//  HomePresenter.swift
//  Plume
//
//  Created by Thomas Rademaker on 3/24/25.
//

import SwiftUI

struct HomePresenter: View {
    @Environment(HomeState.self) private var state
    
    var body: some View {
        @Bindable var state = state
        
        NavigationStack(path: $state.path) {
            HomeView()
                .navigationDestination(for: HomeState.PathDestination.self) {
                    switch $0 {
                    case .blank:
                        Text("BLANK")
                    }
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        ZStack {}
    }
}

#Preview {
    HomePresenter()
        .environment(HomeState(parentState: AppState()))
}
