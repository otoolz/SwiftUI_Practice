//
//  countingAnimationPrac.swift
//  SwiftUI_Practice
//
//  Created by KiWoong Hong on 2022/05/09.
//

import SwiftUI

struct CountingAnimationPrac: View {
    
    @State var num: Int = 0
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8).fill(.black)
                .frame(maxWidth: 100, maxHeight: 150)
                .padding()
                .modifier(CountingNumberAnimationModifier(num: CGFloat(num)))
            
            Button(action: refresh, label: {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .black))
                    .padding()
                    .background(Circle().fill(.green))
            })
        }
    }
}

// extension을 활용해서 button 등의 액션에서 쓸 함수를 만들기도 한다.
extension CountingAnimationPrac {
    fileprivate func refresh() {
        self.num = 0
        
        withAnimation(.easeInOut(duration: 2)) {
            if self.num == 0 {
                self.num = 100
            }
        }
    }
}

// modifier protocol을 이용해 본문의 가독성을 좋게 만들기도 한다.
struct CountingNumberAnimationModifier: AnimatableModifier {
    
    var num: CGFloat
    
    var animatableData: CGFloat {
        get { num }
        set { num = newValue }
    }
    
    func body(content: Content) -> some View {
        content.overlay(NumberLabelView(num: num))
    }
    
    struct NumberLabelView: View {
        let num: CGFloat
        
        var body: some View {
            Text("\(Int(num))")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}

struct countingAnimationPrac_Previews: PreviewProvider {
    static var previews: some View {
        CountingAnimationPrac()
    }
}
