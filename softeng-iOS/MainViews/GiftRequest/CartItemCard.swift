//
//  CartItemCard.swift
//  softeng-iOS
//
//  Created by Alex Siracusa on 4/29/24.
//

import SwiftUI

struct CartItemCard: View {
    let item: CartItem
    let checkout: Bool
    
    init(
        item: CartItem,
        checkout: Bool = false
    ) {
        self.item = item
        self.checkout = checkout
    }
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: item.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 120)
                    .clipped()
            } placeholder: {
                Color.gray
                    .opacity(0.4)
                    .frame(width: 100, height: 120)
            }
            .cornerRadius(8)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(item.name)
                    Text("-")
                    Text("$" + item.price)
                }
                .font(.headline)
                
                Text(item.description)
                    .font(.caption)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    if checkout {
                        CartQuantityPicker(size: 30, item: item)
                    }
                    else {
                        AddToCartButton(size: 30, item: item)
                    }
                }
            }
            .padding(.vertical, 5)
            .padding(.leading, 5)
        }
        .frame(height: 120)
    }
}

#Preview {
    VStack {
        CartItemCard(item: CART_ITEMS[0])
        CartItemCard(item: CART_ITEMS[1], checkout: true)
        CartItemCard(item: CART_ITEMS[2], checkout: true)
    }
    .environmentObject(DatabaseEnvironment.example!)
    .environmentObject(ViewModel())
}
