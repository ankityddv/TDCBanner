//
//  BannerData.swift
//  TDCBanner
//
//  Created by Ankit Yadav on 09/12/21.
//

import UIKit

// Displays banners data and to be binded in each view
struct BannerData: Equatable {
    
    static func == (lhs: BannerData, rhs: BannerData) -> Bool {
        return (lhs.title == rhs.title) && (lhs.detail == rhs.detail) && (lhs.buttonTitle == rhs.buttonTitle) && (lhs.position == rhs.position)
    }
    
    var isPresented: Bool = true
    var type: BannerType
    var title: String
    var detail: String
    var buttonTitle: String?
    var dismissIn: DispatchTime?
    var position: BannerPosition
    var bottomPadding: CGFloat = 0
    var primaryAction: (() -> ())?
}

extension BannerData {
    
    // banner without button action
    init(type: BannerType, title: String, detail: String, position: BannerPosition, hasBottomPadding: Bool = false) {
        self.isPresented = true
        self.type = type
        self.title = title
        self.detail = detail
        self.buttonTitle = nil
        self.dismissIn = .now() + 5
        self.position = position
        self.bottomPadding = hasBottomPadding ? 90 : 0
        self.primaryAction = nil
    }
    
    // banner with button action
    init(type: BannerType, title: String, detail: String, position: BannerPosition, hasBottomPadding: Bool = false, buttonTitle: String? , primaryAction: (() -> ())? ) {
        self.isPresented = true
        self.type = type
        self.title = title
        self.detail = detail
        self.buttonTitle = buttonTitle
        self.dismissIn = .now() + 5
        self.position = position
        self.bottomPadding = hasBottomPadding ? 90 : 0
        self.primaryAction = primaryAction
    }
}
