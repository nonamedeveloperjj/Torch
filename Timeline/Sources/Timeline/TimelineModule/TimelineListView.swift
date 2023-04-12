//
//  TimelineListView.swift
//  
//
//  Created by John Snow on 06/04/2023.
//

import SwiftUI

public struct TimelineListView: View {
    @ObservedObject var viewModel: TimelineListViewModel
    
    public var body: some View {
        List(viewModel.rowModels, id: \.id) { rowModel in
            TimelineStatusContainerView(model: rowModel)
        }.task {
            try? await viewModel.fetchPublicTimelines()
        }.listStyle(.plain)
    }
}
