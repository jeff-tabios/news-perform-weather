//
//  WeatherListItem.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import SwiftUI

struct WeatherListItem: View {

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("CadeView")
                        .foregroundColor(Color("TextColor"))
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Rain")
                        .foregroundColor(Color("TextColor"))
                        .font(.title3)
                }
                .padding()
                Spacer()
                Text("19°")
                    .foregroundColor(Color("TealColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 54))
            }
            .padding()
            Divider()
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)

    }
}

struct WeatherListItem_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListItem()
            .border(.red)
    }
}
