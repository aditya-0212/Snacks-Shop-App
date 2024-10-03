//
//  CartItemView.swift
//  SnackShopApp
//
//  Created by APPLE on 13/08/24.
//

import SwiftUI

struct CartItemView: View {
    @State var productItem = Product()
    @Environment(\.presentationMode) var mode
    @Environment(CartManager.self) var cartManager
    var body: some View {
          VStack{
                HStack{
                    Text("Cart")
                        .font(.system(size: 30).weight(.semibold))
                        .padding(.trailing)
                    
                    Spacer()
                    
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Text("3")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .background(.yellow.opacity(0.5))
                            .clipShape(Capsule())
                    }
                    .foregroundColor(.black)
                    
                    Button{
                   mode.wrappedValue.dismiss()
                    } label:{
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4)
                            )
                    }
                    .foregroundColor(.black)
                }
                .padding(30)
                
              //Card Products
              ScrollView(showsIndicators:false){
                    ForEach(productItem.productList,id: \.id){ item in
                        CartItemList(product: item)
                            
                    }
                }
                //Cart Total
              
              VStack(alignment: .leading){
                  HStack{
                      Text("Delivery Amount")
                      Spacer()
                      Text("$4.00")
                          .font(.system(size:24,weight: .semibold))
                  }
                  
                  Divider()
                  
                  Text("Total Amount")
                      .font(.system(size:24))
                  
                  Text("USD 38.00")
                      .font(.system(size: 36, weight: .semibold))
              }
              .padding(30)
              .frame(maxWidth: .infinity)
              .background(.yellow.opacity(0.5))
              .clipShape(.rect(cornerRadius: 30))
              .padding()
              
              Button{
                  
              } label:{
                  Text("Make Payment")
                      .frame(maxWidth: .infinity)
                      .frame(height: 80)
                      .background(.yellow.opacity(0.5))
                      .font(.system(size:20, weight: .semibold))
                      .foregroundColor(.black)
                      .clipShape(Capsule())
                      .padding()
              }
            }
            
        }
}

#Preview {
    CartItemView()
        .environment(CartManager())
}

struct CartItemList:View {
   var product:ProductModel
    var body: some View{
        HStack(alignment: .center,spacing: 20){
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width:80,height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.headline)
                
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            }
            .padding(.leading)
            Spacer()
            Text("$\(product.price)")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
    }
        .padding()
    }
}
