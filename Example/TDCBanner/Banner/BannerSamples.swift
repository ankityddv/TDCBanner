//
//  BannerSamples.swift
//  TDCBanner
//
//  Created by Ankit Yadav on 09/12/21.
//

import Foundation

struct BannerSamples {
    
    static var hidden = BannerData(isPresented: false, type: .Error, title: "(null)", detail: "(null)", buttonTitle: nil, dismissIn: nil, position: .bottom, bottomPadding: 0, primaryAction: nil)
    
    struct Success {
        static var top = BannerData(type: .Success, title: "This is a sample success title", detail: "This is a sample success banner detail", position: .top)
        static var bottom = BannerData(type: .Success, title: "This is a sample success title", detail: "This is a sample success banner detail", position: .bottom)
        static var bottomWithPadding = BannerData(type: .Success, title: "This is a sample success title", detail: "This is a sample success banner detail", position: .bottom, hasBottomPadding: true)
        
        static var bottomWithButton = BannerData(type: .Success, title: "This is a sample success title with button action", detail: "This is a sample success banner detail", position: .bottom, buttonTitle: "Test Button") {
            print("Tapped")
        }
    }
    
    struct Warning {
        static var top = BannerData(type: .Warning, title: "This is a sample warning title", detail: "This is a sample warning banner detail", position: .top)
        static var bottom = BannerData(type: .Warning, title: "This is a sample warning title", detail: "This is a sample warning banner detail", position: .bottom)
        static var bottomWithPadding = BannerData(type: .Warning, title: "This is a sample warning title", detail: "This is a sample banner warning detail", position: .bottom, hasBottomPadding: true)
    }
    
    struct Info {
        static var top = BannerData(type: .Info, title: "This is a sample info title", detail: "This is a sample info banner detail", position: .top)
        static var bottom = BannerData(type: .Info, title: "This is a sample info title", detail: "This is a sample info banner detail", position: .bottom)
        static var bottomWithPadding = BannerData(type: .Info, title: "This is a sample info title", detail: "This is a sample info banner detail", position: .bottom, hasBottomPadding: true)
    }
    
    struct Error {
        static var top = BannerData(type: .Error, title: "This is a sample error title", detail: "This is a sample error banner detail", position: .top)
        static var bottom = BannerData(type: .Error, title: "This is a sample error title", detail: "This is a sample error banner detail", position: .bottom)
        static var bottomWithPadding = BannerData(type: .Error, title: "This is a sample error title", detail: "This is a sample error banner detail", position: .bottom, hasBottomPadding: true)
    }
    
    struct Upgrade {
        static var top = BannerData(type: .Upgrade, title: "This is a sample upgrade title", detail: "This is a sample upgrade banner detail", position: .top)
        static var bottom = BannerData(type: .Upgrade, title: "This is a sample upgrade title", detail: "This is a sample upgrade banner detail", position: .bottom)
        static var bottomWithPadding = BannerData(type: .Upgrade, title: "This is a sample upgrade title", detail: "This is a sample upgrade banner detail", position: .bottom, hasBottomPadding: true)
    }
}
