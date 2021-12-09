//
//  AirBnb.swift
//  TDCBanner
//
//  Created by Ankit Yadav on 09/12/21.
//

import SwiftUI

enum airbnb: String {
    case light = "AirbnbCerealApp-Light"
    case book = "AirbnbCerealApp-Book"
    case medium = "AirbnbCerealApp-Medium"
    case bold = "AirbnbCerealApp-Bold"
    case black = "AirbnbCerealApp-Black"
    case extraBold = "AirbnbCerealApp-ExtraBold"
}

fileprivate struct AirbnbFontStyle: ViewModifier {
    var weight: airbnb
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom(weight.rawValue, size: size))
    }
}

extension View {
    func airbnb(weight: airbnb, size: CGFloat) -> some View {
        self.modifier(AirbnbFontStyle(weight: weight, size: size))
    }
}
