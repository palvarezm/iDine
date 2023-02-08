//
//  ItemDetailView.swift
//  iDine
//
//  Created by Paul Alvarez on 7/02/23.
//

import SwiftUI

struct ItemDetailView: View {
    enum Constants {
        static let photoCreditPadding = 4.0
        static let photoCreditOffset = (x: -5.0, y: -5.0)
    }

    let item: MenuItem

    @EnvironmentObject var order: Order

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()

                Text("Photo: \(item.photoCredit)")
                    .padding(Constants.photoCreditPadding)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .font(.caption)
                    .offset(x: Constants.photoCreditOffset.x,
                            y: Constants.photoCreditOffset.y)
            }

            Text(item.description)
                .padding()

            Button("Add to cart") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView(item: .mock)
                .environmentObject(Order())
        }
    }
}
