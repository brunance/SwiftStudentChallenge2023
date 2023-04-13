//
//  CustomFont.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 13/04/23.
//

import Foundation
import SwiftUI

struct CustomFont {

    func getFont(size: CGFloat) -> Font {

        let cfURL = Bundle.main.url( forResource: "Silkscreen-Regular", withExtension:
                                        "ttf")! as CFURL

        CTFontManagerRegisterFontsForURL(cfURL,CTFontManagerScope.process,nil)

        let font = Font.custom("Silkscreen-Regular", size: size)

        return font
    }
}

