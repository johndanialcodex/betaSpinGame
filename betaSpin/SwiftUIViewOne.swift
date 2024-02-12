//
//  SwiftUIViewOne.swift
//  betaSpin
//
//  Created by johndanial on 2/1/24.
//

import SwiftUI

struct SwiftUIViewOne: View {
    
    @State private var rotationPhoto: Double = 0.0
    let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
//        RoundedRectangle(cornerRadius: 22)
//            .fill(Color.blue)
//            .frame(width: 300, height: 300)
//            .shadow(radius: 5)
//            .shadow(radius: 10)
//            .shadow(radius: 15)
        Image("spinPhoto")
            .resizable()
            .frame(width: 300, height: 300)
//            .border(Color.black)
            .rotationEffect(.degrees(rotationPhoto))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation {
                            let delta = value.translation.width + value.translation.height
                            rotationPhoto += Double(delta) * 0.5
                            impactFeedback.prepare()
                            impactFeedback.impactOccurred()
                        }
                    }
                    .onEnded { _ in
                        withAnimation {
                            impactFeedback.prepare()
                            impactFeedback.impactOccurred()
                            // You can add deceleration or stopping logic here if needed
                        }
                    }
            )
    }
}

#Preview {
    SwiftUIViewOne()
}
