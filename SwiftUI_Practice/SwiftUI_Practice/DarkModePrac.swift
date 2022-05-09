//
//  DarkModePrac.swift
//  SwiftUI_Practice
//
//  Created by KiWoong Hong on 2022/05/09.
//

import SwiftUI

struct DarkModePrac: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 20) {
                    
                    Text("This text is PRIMARY")
                        .foregroundColor(.primary)
                    Text("This color is SECONDARY")
                        .foregroundColor(.secondary)
                    Text("This color is BLACK")
                        .foregroundColor(.black)
                    Text("This color is WHITE")
                        .foregroundColor(.white)
                    Text("This color is RED")
                        .foregroundColor(.red)
                    Text("This color is globally adaptive")
                        .foregroundColor(Color("AdaptiveColor"))
                    Text("This color is locally AdaptiveColor")
                        .foregroundColor(colorScheme == .light ? .green : .yellow)
                }
            }
            .navigationTitle("Dark Mode Practice")
        }
    }
}

struct DarkModePrac_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DarkModePrac()
                .preferredColorScheme(.light)
            DarkModePrac()
                .preferredColorScheme(.dark)
        }
    }
}
