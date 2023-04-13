//
//  TypewriterText.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 13/04/23.
//

import Foundation
import SwiftUI

struct TypewriterText: View, Animatable {
    var string: String
    var count = 0

    var animatableData: Double {
        get { Double(count) }
        set { count = Int(max(0, newValue)) }
    }

    var body: some View {
        let stringToShow = String(string.prefix(count))
        Text(stringToShow)
    }
}
