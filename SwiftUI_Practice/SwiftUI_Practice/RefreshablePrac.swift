//
//  RefreshablePrac.swift
//  SwiftUI_Practice
//
//  Created by KiWoong Hong on 2022/05/18.
//

import SwiftUI

struct RefreshablePrac: View {
    @State private var randomNum = 50
    var body: some View {
        NavigationView {
            List {
                
                VStack {
                    Text(String(randomNum))
                    Rectangle()
                        .frame(width: CGFloat(randomNum), height: CGFloat(randomNum), alignment: .center)
                }
            }
            .onAppear {
                getRandomNumber()
            }
            .refreshable {
                getRandomNumber()
            }
        }
    }
    func getRandomNumber() {
        randomNum = Int.random(in: 50...150)
    }
}

struct RefreshablePrac_Previews: PreviewProvider {
    static var previews: some View {
        RefreshablePrac()
    }
}
