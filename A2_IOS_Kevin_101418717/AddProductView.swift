//
//  AddProductView.swift
//  A2_IOS_Kevin_101418717
//
//  Created by kevin bhangu on 2025-03-28.
//
//

import SwiftUI

struct AddProductView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var desc = ""
    @State private var price = ""
    @State private var provider = ""

    var body: some View {
        Form {
            TextField("Product Name", text: $name)
            TextField("Description", text: $desc)
            TextField("Price", text: $price)
                .keyboardType(.decimalPad)
            TextField("Provider", text: $provider)

            Button("Save Product") {
                let newProduct = Product(context: viewContext)
                newProduct.id = UUID()
                newProduct.name = name
                newProduct.desc = desc
                newProduct.price = Double(price) ?? 0.0
                newProduct.provider = provider

                try? viewContext.save()
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Add Product") //
    }
}



