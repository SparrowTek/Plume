//
//  HomeState.swift
//  Plume
//
//  Created by Thomas Rademaker on 3/24/25.
//

import SwiftUI

@Observable
@MainActor
class HomeState {
    enum PathDestination {
        case blank
    }
    
    private unowned let parentState: AppState
    var path: [PathDestination] = []
    
    init(parentState: AppState) {
        self.parentState = parentState
    }
}
