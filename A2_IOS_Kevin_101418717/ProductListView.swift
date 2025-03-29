//
//  ProductListView.swift
//  A2_IOS_Kevin_101418717
//
//  Created by kevin bhangu on 2025-03-28.
//

import SwiftUI

struct ProductListView: View {
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: []
    ) var products: FetchedResults<Product>

    var body: some View {
        List(products, id: \.self) { product in
            VStack(alignment: .leading) {
                Text(product.name ?? "").font(.headline)
                Text(product.desc ?? "")
            }
        }
        .navigationTitle("All Products") 
    }
}


