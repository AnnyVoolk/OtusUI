//
//  NavTransistion.swift
//  HomeWork2
//
//  Created by Anna Volkova on 29.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

public enum NavTransiton {
    
    case none
    case custom(push: AnyTransition, pop: AnyTransition)
}
