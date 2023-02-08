//
//  ItemRowView.swift
//  iDine
//
//  Created by Paul Alvarez on 7/02/23.
//

import SwiftUI

struct ItemRowView: View {
    // MARK: - Variables
    let item: MenuItem

    enum Constants {
        static let thumbnailImageSpacing = 12.0
        static let thumbnailImageLineWidth = 2.0
        static let restrictionsSpacing = 5.0
        static let restrictionsColors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    }

    // MARK: - View
    var body: some View {
        HStack(spacing: Constants.thumbnailImageSpacing) {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: Constants.thumbnailImageLineWidth))

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }

            Spacer()

            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(Constants.restrictionsSpacing)
                    .background(Constants.restrictionsColors[restriction])
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
        }
    }
}

// MARK: - Preview
struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: MenuItem.mock)
    }
}
