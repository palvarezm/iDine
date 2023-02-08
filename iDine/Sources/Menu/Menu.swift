//
//  Menu.swift
//  iDine
//
//  Created by Paul Alvarez on 7/02/23.
//

import Foundation

struct MenuSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}

struct MenuItem: Codable, Identifiable, Hashable {
    var id: UUID
    var name: String
    var photoCredit: String
    var price: Int
    var restrictions: [String]
    var description: String

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }

    #if DEBUG
    static let mock = MenuItem(id: UUID(),
                               name: "Maple French Toast",
                               photoCredit: "Joseph Gonzalez",
                               price: 6,
                               restrictions: ["G", "V"],
                               description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    #endif
}
