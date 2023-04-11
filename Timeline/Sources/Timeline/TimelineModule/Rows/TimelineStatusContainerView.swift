//
//  TimelineStatusContainerView.swift
//  
//
//  Created by John Snow on 06/04/2023.
//

import SwiftUI
import TorchNetwork

struct TimelineStatusContainerView: View {
    @State private var model: Model
    
    var body: some View {
        VStack(spacing: 8.0) {
            TimelineStatusHeaderView(model: model.headerModel)
            
            if let textModel = model.textModel {
                TimelineStatusTextView(model: textModel)
            }
            
            TimelineStatusFooterView(model: model.footerModel)
        }
    }
    
    init(model: Model) {
        _model = State(initialValue: model)
    }
}

extension TimelineStatusContainerView {
    struct Model {
        let id: String
        let headerModel: TimelineStatusHeaderView.Model
        let textModel: TimelineStatusTextView.Model?
        let footerModel: TimelineStatusFooterView.Model
    }
}

struct TimelineStatusContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineStatusContainerView(
            model: .init(
                id: "1",
                headerModel: .stubData,
                textModel: .stubData,
                footerModel: .stubData
            )
        )
    }
}
