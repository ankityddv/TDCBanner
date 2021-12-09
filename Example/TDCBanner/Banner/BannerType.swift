//
//  BannerType.swift
//  TDCBanner
//
//  Created by Ankit Yadav on 09/12/21.
//

import SwiftUI

enum BannerType {
    case Info
    case Warning
    case Success
    case Error
    case Upgrade
}

extension BannerType {
    var tintColor: Color {
        switch self {
        case .Info:
            return Color(red: 67/255, green: 154/255, blue: 215/255)
        case .Success:
            return Color.green
        case .Warning:
            return Color.orange
        case .Error:
            return Color.red
        case .Upgrade:
            return Color.appColor
        }
    }
    
    var icon : Image {
        switch self {
        case .Info:
            return Image(systemName: "info")
        case .Warning:
            return Image(systemName: "info")
        case .Success:
            return Icons.check
        case .Error:
            return Image(systemName: "info")
        case .Upgrade:
            return Image(systemName: "arrow.up.heart.fill")
        }
    }
}
