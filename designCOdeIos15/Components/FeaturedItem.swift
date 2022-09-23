//
//  FeaturedItem.swift
//  designCOdeIos15
//
//  Created by to on 2022/9/22.
//

import SwiftUI

struct FeaturedItem: View {
    var course: Course = courses[0]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8.0) {
                Spacer()
                Image(course.logo)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26.0, height: 26.0)
                    .cornerRadius(10.0)
                    .padding(9)
                    .background(.ultraThinMaterial, in :
                                    RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .strokeStyle(cornerRadius: 16)
                
                Text(course.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomLeading))
                Text(course.subtitle.uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    
                Text(course.text)
                    .font(.footnote)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.secondary)
                    
                    
            }
            .padding(.all, 20.0)
            .padding(.vertical, 20.0)
            .frame(height: 350.0)
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//            .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
//            .mask(Circle().opacity(0.5))
//            .mask(Ellipse().frame(width: 300, height: 200))
//            .mask(Rectangle().frame(width: 300, height: 200))
//            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
           
            .strokeStyle()
            .padding(.horizontal, 20.0)
            
        }
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem()
    }
}
