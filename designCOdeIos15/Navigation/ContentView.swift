//
//  ContentView.swift
//  designCOdeIos15
//
//  Created by to on 2022/9/20.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        //        原生 tabbar 用法
        //        TabView {
        //            ContentView()
        //                .tabItem {
        //                    Image(systemName: "house")
        //                    Text("Learn now")
        //                }
        //            AccountView()
        //                .tabItem {
        //                    Image(systemName: "magnifyingglass")
        //                    Text("Explore")
        //                }
        //        }
                
                
        //        自定义
        ZStack(alignment: .bottom) {

                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
                    AccountView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
                        
            TabBar()
        }
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
            ContentView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
        }
    }
}
