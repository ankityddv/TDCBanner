//
//  ContentView.swift
//  TDCBanner
//
//  Created by Ankit Yadav on 09/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var bannerService = BannerService()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Group {
                    VStack {
                        BannerButton(title: "Top banner", type: .Success) {
                            bannerService.showBanner(with: BannerSamples.Success.top)
                        }
                        
                        BannerButton(title: "Bottom banner", type: .Success) {
                            bannerService.showBanner(with: BannerSamples.Success.bottom)
                        }
                        
                        BannerButton(title: "Bottom banner with padding", type: .Success) {
                            bannerService.showBanner(with: BannerSamples.Success.bottomWithPadding)
                        }
                        
                        BannerButton(title: "Bottom banner with action button", type: .Success) {
                            bannerService.showBanner(with: BannerSamples.Success.bottomWithButton)
                        }
                    }
                    .modifier(SectionStyle(title: "Success"))
                    
                    VStack {
                        BannerButton(title: "Top banner", type: .Warning) {
                            bannerService.showBanner(with: BannerSamples.Warning.top)
                        }
                        
                        BannerButton(title: "Bottom banner", type: .Warning) {
                            bannerService.showBanner(with: BannerSamples.Warning.bottom)
                        }
                        
                        BannerButton(title: "Bottom banner with padding", type: .Warning) {
                            bannerService.showBanner(with: BannerSamples.Warning.bottomWithPadding)
                        }
                    }
                    .modifier(SectionStyle(title: "Warning"))
                    
                    VStack {
                        BannerButton(title: "Top banner", type: .Info) {
                            bannerService.showBanner(with: BannerSamples.Info.top)
                        }
                        
                        BannerButton(title: "Bottom banner", type: .Info) {
                            bannerService.showBanner(with: BannerSamples.Info.bottom)
                        }
                        
                        BannerButton(title: "Bottom banner with padding", type: .Info) {
                            bannerService.showBanner(with: BannerSamples.Info.bottomWithPadding)
                        }
                    }
                    .modifier(SectionStyle(title: "Info"))
                    
                    VStack {
                        BannerButton(title: "Top banner", type: .Error) {
                            bannerService.showBanner(with: BannerSamples.Error.top)
                        }
                        
                        BannerButton(title: "Bottom banner", type: .Error) {
                            bannerService.showBanner(with: BannerSamples.Error.bottom)
                        }
                        
                        BannerButton(title: "Bottom banner with padding", type: .Error) {
                            bannerService.showBanner(with: BannerSamples.Error.bottomWithPadding)
                        }
                    }
                    .modifier(SectionStyle(title: "Error"))
                    
                    VStack {
                        BannerButton(title: "Top banner", type: .Upgrade) {
                            bannerService.showBanner(with: BannerSamples.Upgrade.top)
                        }
                        
                        BannerButton(title: "Bottom banner", type: .Upgrade) {
                            bannerService.showBanner(with: BannerSamples.Upgrade.bottom)
                        }
                        
                        BannerButton(title: "Bottom banner with padding", type: .Upgrade) {
                            bannerService.showBanner(with: BannerSamples.Upgrade.bottomWithPadding)
                        }
                    }
                    .modifier(SectionStyle(title: "Upgrade"))
                }
            }
            .navigationTitle("TDC Banner")
            .banner(data: $bannerService.currentBanner)
        }
    }
}

struct BannerButton: View {
    
    var title: String
    var type: BannerType
    var action: ()->()
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .padding()
            .background(type.tintColor)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

fileprivate struct SectionStyle: ViewModifier {
    
    var title: String
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.blackColor)
                
                Spacer()
            }
            .padding(.bottom)
            
            content
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
