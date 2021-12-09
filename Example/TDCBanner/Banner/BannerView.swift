//
//  Banner.swift
//  TestApp
//
//  Created by Ankit Yadav on 09/12/21.
//

import SwiftUI

fileprivate struct BannerModifier: ViewModifier {

    @Binding var data: BannerData
    
    func body(content: Content) -> some View {
        content
            .overlay(BannerView(data: $data))
    }
}

fileprivate struct BannerView: View {
    
    @Binding private var data: BannerData
    private var action: (() -> ())?
    
    init(data: Binding<BannerData>) {
        self._data = data
        
        // don't trigger haptics for default value of banner
        if data.wrappedValue == BannerSamples.hidden {
            Core.Haptics.light()
        }
        
        //.. initialise action
        self.action = data.primaryAction.wrappedValue ?? nil
        
        //.. swap position of banner from top to bottom if iPad / Mac
        configureForiPad()
    }
    
    var body: some View {
        if data.isPresented {
            VStack {
                
                if data.position == .bottom {
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    //.. action icon
                    let rectangleIconSize: CGFloat = 30
                    RoundedRectangle(cornerRadius: rectangleIconSize/4)
                        .foregroundColor(data.type.tintColor)
                        .frame(width: rectangleIconSize, height: rectangleIconSize)
                        .overlay(
                            ZStack {
                                if data.type == .Success || data.type == .Info || data.type == .Upgrade {
                                    let circleSize: CGFloat = 20
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width: circleSize, height: circleSize)
                                } else {
                                    let triangleSize: CGFloat = 9
                                    Triangle()
                                        .stroke(.white ,style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                                        .frame(width: triangleSize, height: triangleSize)
                                }

                                let iconSize: CGFloat = data.type == .Success || data.type == .Info || data.type == .Upgrade ? 10 : 7
                                data.type.icon
                                    .resizable()
                                    .frame(width: iconSize, height: iconSize)
                                    .foregroundColor(data.type.tintColor)
                            }
                        )
                    
                    //.. action detail
                    VStack(alignment: .leading, spacing: 5) {
                        Text(data.title.uppercased())
                            .airbnb(weight: .medium, size: 10)
                            .foregroundColor(.gray)
                        
                        Text(data.detail)
                            .airbnb(weight: .medium, size: 15)
                    }
                    
                    Spacer()
                    
                    //.. hide btn
                    if data.buttonTitle == nil {
                        Button {
                            Core.Haptics.light()
                            withAnimation {
                                data.isPresented.toggle()
                            }
                        } label: {
                            Icons.cross
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color.blackColor)
                        }
                    }
                    
                    //.. action
                    if let buttonTitle = data.buttonTitle {
                        Button {
                            Core.Haptics.light()
                            if let action = action {
                                action()
                            }
                        } label: {
                            Text(buttonTitle)
                                .airbnb(weight: .book, size: 14)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .foregroundColor(.white)
                                .background(data.type.tintColor)
                                .clipShape(Capsule())
                        }
                    }
                }
                .if(data.position == .top) { view in
                    view
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.bottom, 20)
                        .background(.ultraThinMaterial)
                }
                .if(data.position == .bottom) { view in
                    view
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .cornerRadius(18)
                        .padding()
                        .padding(.bottom, data.bottomPadding)
                }
                
                if data.position == .top {
                    Spacer()
                }
            }
            .offset(y: data.isPresented ? 0 : (data.position == .top ? -200 : (data.position == .bottom ? 200 : 0)))
        }
    }
    
    private func configureForiPad() {
        if UIDevice.isiPadOS, data.position == .top {
            data.position = .bottom
            data.bottomPadding = 0
        }
    }
}

extension View {
    func banner(data: Binding<BannerData>) -> some View {
        self.modifier(BannerModifier(data: data))
    }
}
