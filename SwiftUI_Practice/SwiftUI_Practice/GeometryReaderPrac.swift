//
//  GeometryReaderPrac.swift
//  SwiftUI_Practice
//
//  Created by KiWoong Hong on 2022/05/22.
//

import SwiftUI

struct GeometryReaderPrac: View {
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 15)
                            .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 90), axis: (x: 0.0, y: 0.0, z: 1.0))
                    }
                    .frame(width: 300, height: 200)
                    .padding()
                }
            }
            
        })

//        GeometryReader(content: { geometry in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: geometry.size.width * 0.6666)
//                Rectangle().fill(Color.blue)
//            }
//            .ignoresSafeArea()
//        })
//
    }
}

struct GeometryReaderPrac_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderPrac()
    }
}
