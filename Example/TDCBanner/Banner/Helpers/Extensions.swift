//
//  extensions.swift
//  TDCBanner
//
//  Created by Ankit Yadav on 09/12/21.
//

import UIKit

extension UIDevice {
    
    static var isMacOSCatalyst: Bool {
        #if targetEnvironment(macCatalyst)
            return true
        #else
            return false
        #endif
    }
    
    static var isMacOS: Bool {
        return UIDevice.current.userInterfaceIdiom == .mac
    }
    
    static var isiPadOS: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isiOS: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
}
