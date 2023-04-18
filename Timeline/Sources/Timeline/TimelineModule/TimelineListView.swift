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
        NavigationView {
            let rowModels = viewModel.rowModels
            List(0..<rowModels.count, id: \.self) { index in
                TimelineStatusContainerView(model: rowModels[index])
                    .task {
                        try? await viewModel.fetchMoreStatusesIfNeeded(shownIndex: index)
                    }
                
                if index == viewModel.rowModels.endIndex - 1, viewModel.isLoadingMoreStatuses {
                    bottomProgressView
                        .id(UUID())
                }
            }.task {
                try? await viewModel.fetchPublicTimelines()
            }
            .listStyle(.plain)
            .navigationBarHidden(false)
        }
    }
    
    @ViewBuilder
    private var bottomProgressView: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
        .padding()
        .listRowSeparator(.hidden)
    }
}
