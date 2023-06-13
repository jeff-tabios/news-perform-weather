//
//  CountryList.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import SwiftUI

struct CountryItem: View {
    var body: some View {
        Button {
            //Action goes here
        } label: {
            VStack {
                HStack {
                    Text("Australia")
                        .foregroundColor(Color("TextColor"))
                        .font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("TealColor"))
                        .imageScale(.large)
                }
                .padding()
                Divider()
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct CountryListHeader: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 60)
                .foregroundColor(Color("GreenColor"))
            Text("Countries")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title3)
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .imageScale(.large)
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct CountryList: View {
    var body: some View {
        VStack {
            CountryListHeader()
            ScrollView {
                CountryItem()
                CountryItem()
                CountryItem()
                CountryItem()
                CountryItem()
                CountryItem()
                CountryItem()
                CountryItem()
                CountryItem()
                CountryItem()
            }
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList()
    }
}
