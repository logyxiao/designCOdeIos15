//
//  designCOdeIos15App.swift
//  designCOdeIos15
//
//  Created by to on 2022/9/20.
//

import SwiftUI

@main
struct DesignCodeiOS15App: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
