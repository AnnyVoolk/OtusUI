//
//  Screen.swift
//  HomeWork2
//
//  Created by Anna Volkova on 29.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

public struct Screen: Identifiable, Equatable {
    
    public let id: String
    public let nextScreen: AnyView
    
    public init(id: String, nextScreen: AnyView) {
        self.id = id
        self.nextScreen = nextScreen
    }
    
    public static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}

public struct ScreenStack {
    
    private var screens = [Screen]()
    
    public func top() -> Screen? {
        screens.last
    }
    
    public mutating func push(_ s: Screen) {
        screens.append(s)
    }
    
    public mutating func popToPrevious() {
        _ = screens.popLast()
    }
    
    public mutating func popToRoot() {
        screens.removeAll()
    }
}
