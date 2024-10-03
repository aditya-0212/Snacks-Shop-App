//
//  ContentView.swift
//  SnackShopApp
//
//  Created by APPLE on 03/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var cartManager = CartManager()
    var body: some View {
        ZStack(alignment: .bottom){
            Home()
                .environment(cartManager)
            
            if cartManager.products.count > 0{
                HStack(spacing: 30){
                    Text("\(cartManager.products.count)")
                        .padding()
                        .background(.yellow)
                        .clipShape(Circle())
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading){
                        Text("Cart")
                            .font(.system(size:26,weight: .semibold))
                        
                        Text("\(cartManager.products.count) Item")
                            .font(.system(size:18))
                    }
                    
                    Spacer()
                    
                    ForEach(cartManager.products, id: \.name){ product in
                        Image(product.image)
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                            .frame(width:60, height: 60)
                            .background(.white)
                            .clipShape(Circle())
                            .padding(.leading, -60)
                    }
                }
                .padding()
                .frame(width: .infinity,height: 100)
                .background(.black)
                .foregroundColor(.white)
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
