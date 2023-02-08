//
//  CheckoutView.swift
//  iDine
//
//  Created by Paul Alvarez on 7/02/23.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order

    @State private var selectedPaymentType = PaymentTypes.cash

    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""

    @State private var selectedTipAmount = TipAmounts.fifteen

    @State private var shouldShowPaymentAlert = false

    var totalPrice: String {
        let totalPrice = Double(order.total)
        let tipValue = totalPrice / 100 * Double(selectedTipAmount.rawValue)
        return (totalPrice + tipValue).formatted(.currency(code: "USD"))
    }

    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $selectedPaymentType) {
                    ForEach(PaymentTypes.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }

                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }

            Section("Add a tip") {
                Picker("Percentage:", selection: $selectedTipAmount) {
                    ForEach(TipAmounts.allCases, id: \.self) {
                        Text("\($0.rawValue)")
                    }
                }
                .pickerStyle(.segmented)
            }

            Section("Total: \(totalPrice)") {
                Button("Confirm order") {
                    shouldShowPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $shouldShowPaymentAlert) {
            
        } message: {
            Text("Your total was \(totalPrice) - thank you!")
        }
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView()
                .environmentObject(Order())
        }
    }
}

private enum PaymentTypes: String, CaseIterable {
    case cash = "Cash"
    case creditCard = "Credit Card"
    case iDinePoints = "iDine points"
}

private enum TipAmounts: Int, CaseIterable {
    case ten = 10
    case fifteen = 15
    case twenty = 20
    case twentyfive = 25
    case zero = 0
}
