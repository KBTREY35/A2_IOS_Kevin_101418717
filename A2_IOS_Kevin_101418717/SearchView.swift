//
//  SearchView.swift
//  A2_IOS_Kevin_101418717
//
//  Created by kevin bhangu on 2025-03-28.
//
//

import SwiftUI
import CoreData

struct SearchView: View {
    @Environment(\.managedObjectContext) var context
    @State private var searchText = ""
    @State private var results: [Product] = []

    var body: some View {
        VStack {
            TextField("Search by name or description", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Search") {
                let request: NSFetchRequest<Product> = Product.fetchRequest()
                request.predicate = NSPredicate(format: "name CONTAINS[cd] %@ OR desc CONTAINS[cd] %@", searchText, searchText)//
                results = (try? context.fetch(request)) ?? []
            }//

            List(results, id: \.self) { product in
                VStack(alignment: .leading) {
                    Text(product.name ?? "").bold()
                    Text(product.desc ?? "")
                }
            }
        }
        .padding()
        .navigationTitle("Search Products") //
    }
}



