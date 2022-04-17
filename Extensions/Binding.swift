//
//  Binding.swift
//  RockBrainUp
//
//  Created by Haneen Mahdin on 16/04/22.
//

import Foundation
import SwiftUI

extension Binding {
    var value: Value {
        get {
            wrappedValue
        }
    }
    
    func changeValue(_ value: Value) {
        self.wrappedValue = value
    }
}
