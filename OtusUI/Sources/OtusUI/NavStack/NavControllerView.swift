//
//  NavControllerView.swift
//  HomeWork2
//
//  Created by Anna Volkova on 29.09.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import SwiftUI

public struct NavControllerView<Content>: View where Content: View {
    
    @ObservedObject private var viewModel: NavControllerViewModel
    
    private let content: Content
    private let transition: (push: AnyTransition, pop: AnyTransition)
    
    public init(transition: NavTransiton, easing: Animation = .easeOut(duration: 0.33), @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = NavControllerViewModel(easing: easing)
        self.content = content()
        switch transition {
        case .custom(let pushTransition, let popTransition):
            self.transition = (pushTransition, popTransition)
        case .none:
            self.transition = (.identity, .identity)
        }
    }
    
   public  var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                content
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            } else {
                viewModel.currentScreen!.nextScreen
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}
