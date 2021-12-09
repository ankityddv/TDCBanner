//
//  BannerService.swift
//  TDCBanner
//
//  Created by Ankit Yadav on 09/12/21.
//

import SwiftUI

class BannerService: ObservableObject {
    
    // this data is to be binded with the base view and changed as per requirememnt
    @Published var currentBanner: BannerData = BannerSamples.hidden
    
    // display banner to the user
    func showBanner(with bannerData: BannerData) {
        withAnimation {
            currentBanner = bannerData
        }
        
        // set current banner to nil so it doesn't pop up accidentally again
        dismissBanner(in: .now() + 5.4)
    }
    
    private func dismissBanner(in time: DispatchTime) {
        DispatchQueue.main.asyncAfter(deadline: time) {
            if self.currentBanner.isPresented {
                withAnimation {
                    self.currentBanner.isPresented = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
                        currentBanner = BannerSamples.hidden
                    }
                }
            }
        }
    }
}
