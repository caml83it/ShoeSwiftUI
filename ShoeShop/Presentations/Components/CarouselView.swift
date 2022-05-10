//
//  CarouselView.swift
//  ShoeShop
//
//  Created by CamL on 11/05/2022.
//

import SwiftUI

struct CarouselView<Content:View>: View {
    private var numberOfItems: Int
    private var content: Content
    @State var slideGesture: CGSize = CGSize.zero
    @State private var currentIndex: Int = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    init(numberOfItems: Int, @ViewBuilder content: () -> Content) {
        self.numberOfItems = numberOfItems
        self.content = content()
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
            .offset(x: CGFloat(self.currentIndex) * -geometry.size.width, y: 0)
            .animation(.spring())
            .onReceive(self.timer) { _ in
                self.currentIndex = (self.currentIndex + 1) % self.numberOfItems
            }
            .gesture(
                DragGesture().onChanged({ value in
                    self.slideGesture = value.translation
                })
                .onEnded({ value in
                    if self.slideGesture.width < -50 {
                        if self.currentIndex < self.numberOfItems - 1 {
                            withAnimation {
                                self.currentIndex += 1
                            }
                        }
                    }
                    if self.slideGesture.width > 50 {
                        if self.currentIndex > 0 {
                            withAnimation {
                                self.currentIndex -= 1
                            }
                        }
                    }
                    self.slideGesture = .zero
                })
            )
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(numberOfItems: 5) {
            
        }
    }
}
