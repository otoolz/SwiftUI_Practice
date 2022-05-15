//
//  OnAppearPrac.swift
//  SwiftUI_Practice
//
//  Created by KiWoong Hong on 2022/05/15.
//

import SwiftUI

struct OnAppearPrac: View {
    
    @State var myText: String = "Start text."
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This is the new text!"
                    
                }
            })
            .onDisappear(perform: {
                myText = "Ending text."
                // it change after destroy ScrollView, So we can't see the text
            })
            .navigationTitle("On Appear \(count)")
        }
    }
}

struct OnAppearPrac_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearPrac()
    }
}
