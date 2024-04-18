//
//  MainView.swift
//  EmojiFinder
//
//  Created by AffanDN on 18/04/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "ev.plug.dc.nacs")
                }
            
            Text("Map View")
                .tabItem {
                    Label("Map View", systemImage: "binoculars.fill")
                }
            // nampilin badge
                .badge(4)
            Text("Settings View")
                .tabItem {
                    Label("Settings View", systemImage: "gamecontroller.fill")
                }
            
        }
    }
}

#Preview {
    MainView()
}
