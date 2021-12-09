//
//  Core.swift
//  TDCBanner
//
//  Created by Ankit Yadav on 09/12/21.
//

import UIKit

struct Core {
    struct Haptics {
        static func light() {
            lightGenerator.impactOccurred()
        }
        
        static func soft() {
            softGenerator.impactOccurred()
        }
        
        static private var lightGenerator: UIImpactFeedbackGenerator {
            return UIImpactFeedbackGenerator(style: .light)
        }
        
        static private var softGenerator: UIImpactFeedbackGenerator {
            return UIImpactFeedbackGenerator(style: .soft)
        }
    }
}
