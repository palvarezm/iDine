//
//  OrderView.swift
//  iDine
//
//  Created by Paul Alvarez on 7/02/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)

                            Spacer()

                            Text("$ \(item.price)")
                        }
                    }
                    .onDelete(perform: removeItem)
                }

                Section {
                    NavigationLink("Place order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationBarTitle("Order")
            .toolbar {
                EditButton()
            }
        }
    }

    func removeItem(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
