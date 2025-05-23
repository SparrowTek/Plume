//
//  SearchPresenter.swift
//  Plume
//
//  Created by Thomas Rademaker on 8/27/23.
//

import SwiftUI

struct SearchPresenter: View {
    var body: some View {
        NavigationStack {
            SearchView()
        }
    }
}

struct SearchView: View {
    var body: some View {
        UnderConstructionView()
            .navBar()
            .fullScreenColorView()
    }
}

#Preview {
    SearchPresenter()
}
