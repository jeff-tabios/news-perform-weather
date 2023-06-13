//
//  WeatherDetail.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import SwiftUI

struct WeatherDetail: View {
    var body: some View {
        VStack {
            WeatherListItem()
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Feels Like")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("16°")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TealColor"))
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Feels Like")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("16°")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TealColor"))
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Feels Like")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("16°")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TealColor"))
                }
                Spacer()
            }
            Divider()
            Text("Last Updated 9:00am 01 December 2017")
                .foregroundColor(Color("TextColor"))
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Detail")
    }
}

struct WeatherDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherDetail()
        }
    }
}
