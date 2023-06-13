//
//  ContentView.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/13/23.
//

import SwiftUI

struct ContentView: View {

    init() {
        setupNavBar()
    }
    
    var body: some View {
        NavigationView {
            WeatherPage()
        }
    }

    func setupNavBar() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(named: "GreenColor")
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        let backItemAppearance = UIBarButtonItemAppearance()
        backItemAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.white]
        coloredAppearance.backButtonAppearance = backItemAppearance
        let image = UIImage(systemName: "chevron.backward")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        coloredAppearance.setBackIndicatorImage(image, transitionMaskImage: image)
        let navBar = UINavigationBar.appearance()
        navBar.standardAppearance = coloredAppearance
        navBar.compactAppearance = coloredAppearance
        navBar.scrollEdgeAppearance = coloredAppearance
        navBar.tintColor = .white
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
