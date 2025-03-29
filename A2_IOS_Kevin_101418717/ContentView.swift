//
//  ContentView.swift
//  A2_IOS_Kevin_101418717
//
//  Created by kevin bhangu on 2025-03-28.
//

import SwiftUI
import CoreData
//
struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: []
    ) var products: FetchedResults<Product>
    
    @State private var currentIndex: Int = 0

    var body: some View {
        VStack(spacing: 20) {
            if !products.isEmpty {
                let product = products[currentIndex]
                Text(product.name ?? "")
                    .font(.title)
                Text(product.desc ?? "")
                Text("Price: $\(product.price, specifier: "%.2f")")
                Text("Provider: \(product.provider ?? "")")
                
                HStack {
                    Button("Previous") {
                        if currentIndex > 0 { currentIndex -= 1 }
                    }
                    Button("Next") {
                        if currentIndex < products.count - 1 { currentIndex += 1 }
                    }
                }
            } else {
                Text("No products found.")
            }

            NavigationLink("Search Product", destination: SearchView())//
            NavigationLink("Add New Product", destination: AddProductView())//
            NavigationLink("View All Products", destination: ProductListView())//
        }
        .padding()
        .onAppear {
            seedInitialProductsIfNeeded()
        }
        .navigationTitle("Product Viewer")
    }

    func seedInitialProductsIfNeeded() {
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        let count = (try? viewContext.count(for: fetchRequest)) ?? 0
        if count == 0 {
            for i in 1...10 {
                let product = Product(context: viewContext)
                product.id = UUID()
                product.name = "Product \(i)"
                product.desc = "Description for product \(i)"
                product.price = Double(i) * 9.99 //
                product.provider = "Provider \(i)"
            }
            try? viewContext.save()
        }
    }
}


