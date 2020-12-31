//
//  RingView.swift
//  SwiftUIBatteryState
//
//  Created by db J on 2020/12/31.
//

import SwiftUI

struct RingView: View {
    var width: CGFloat = 200
    var percent: CGFloat = 10
    var color1 = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
    var color2 = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
    
    var body: some View {
        let mutiplier = width / 44
        let progress = 1 - percent / 100
        
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1),
                        style: StrokeStyle(lineWidth: 5 * mutiplier))
                .frame(width: width, height: width)
            
            Circle()
                .trim(from: progress, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topLeading, endPoint: .bottomTrailing),
                    style: StrokeStyle(lineWidth: 5 * mutiplier, lineCap: .round, lineJoin: .round)
            )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: width)
                .shadow(color: Color(color1).opacity(0.1), radius: 3, x: 0, y: 3)
            
            VStack(spacing: 10) {
                Text("\(Int(percent))%")
                    .font(.system(size: 14 * mutiplier))
                    .fontWeight(.bold)
                Text("当前电量")
                    .font(.system(size: 4 * mutiplier))
                    .fontWeight(.bold)
            }
            
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
