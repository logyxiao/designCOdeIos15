//
//  BlobView.swift
//  designCOdeIos15
//
//  Created by to on 2022/9/21.
//

import SwiftUI

struct BlobView: View {
    @State var appear = false
    
    var body: some View {
//        MyCustomShape()
//            .frame(width: 270, height: 271)
//            .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        
        
        
        TimelineView(.animation) { timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angleX = Angle.degrees(now.remainder(dividingBy: 3)*60)
            let x = cos(angleX.radians)
            
            let angleY = Angle.degrees(now.remainder(dividingBy: 3)*10)
            let y = cos(angleY.radians)
            
            Canvas {context, size in
                context.fill(path(in: CGRect(x:0, y:0, width:size.width, height:size.height), x:x, y: y), with: .linearGradient(Gradient(colors: [.pink, .blue]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 400, y: 414)))
            }
            .frame(width: 400, height: 414)
            .rotationEffect(.degrees(appear ? 360 :30))
        }
        .onAppear{
            withAnimation(.linear(duration: 30).repeatForever(autoreverses:true).delay(1)) {
                appear = true
            }
        }
    }
    
    func path(in rect: CGRect, x: Double, y: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.9923*width, y: 0.42593*height))
        path.addCurve(to: CGPoint(x: 0.6355*width*y, y: height), control1: CGPoint(x: 0.92554*width*y, y: 0.77749*height*y), control2: CGPoint(x: 0.91864*width*y, y: height))
        path.addCurve(to: CGPoint(x: 0.08995*width, y: 0.60171*height), control1: CGPoint(x: 0.35237*width*x, y: height), control2: CGPoint(x: 0.2695*width, y: 0.77304*height))
        path.addCurve(to: CGPoint(x: 0.34086*width, y: 0.06324*height*x), control1: CGPoint(x: -0.0896*width, y: 0.43038*height), control2: CGPoint(x: 0.00248*width, y: 0.23012*height*x))
        path.addCurve(to: CGPoint(x: 0.9923*width, y: 0.42593*height), control1: CGPoint(x: 0.67924*width, y: -0.10364*height*x), control2: CGPoint(x: 1.05906*width, y: 0.07436*height*y))
        path.closeSubpath()
        return path
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        BlobView()
    }
}

struct MyCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99747*width, y: 0.47072*height))
        path.addCurve(to: CGPoint(x: 0.54271*width, y: 0.92793*height), control1: CGPoint(x: 0.99747*width, y: 0.77477*height), control2: CGPoint(x: 0.95222*width, y: 1.15315*height))
        path.addCurve(to: CGPoint(x: 0.08796*width, y: 0.47072*height), control1: CGPoint(x: 0.13321*width, y: 0.7027*height), control2: CGPoint(x: 0.30516*width, y: 0.70721*height))
        path.addCurve(to: CGPoint(x: 0.54271*width, y: 0.01351*height), control1: CGPoint(x: -0.12923*width, y: 0.23423*height), control2: CGPoint(x: 0.08796*width, y: -0.06757*height))
        path.addCurve(to: CGPoint(x: 0.99747*width, y: 0.47072*height), control1: CGPoint(x: 0.99747*width, y: 0.09459*height), control2: CGPoint(x: 0.99747*width, y: 0.16667*height))
        path.closeSubpath()
        return path
    }
}
