//
//  ContentView.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/13/23.
//

import SwiftUI

struct ContentView: View {

    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(named: "GreenColor")
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        let navBar = UINavigationBar.appearance()
        navBar.standardAppearance = coloredAppearance
        navBar.compactAppearance = coloredAppearance
        navBar.scrollEdgeAppearance = coloredAppearance
        navBar.tintColor = .white
    }
    
    var body: some View {
        NavigationView {
            WeatherPage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
