//
//  CollectionView.swift
//  SnackShopApp
//
//  Created by APPLE on 13/08/24.
//

import SwiftUI

struct CollectionView: View {
    @Environment(CartManager.self) var cartManager
    @Environment(\.presentationMode) var mode
    @State var productItem = Product()
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationStack{
                VStack{
                    HStack{
                        Text("Order From The Best OF **Snacks**")
                            .font(.system(size:20))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .padding()
                            .frame(width:50, height:70)
                            .overlay(RoundedRectangle(cornerRadius:50).stroke().opacity(0.4))
                    }
                    .padding(30)
                }
            ScrollView(showsIndicators:false){
                LazyVGrid(columns: layout){
                    ForEach(productItem.productList,id:\.id){ item in
                        SmallProductCard(product:item)
                            .environment(cartManager)
                    }
                }
                .padding()
                
                
            }
        }
    }
}

#Preview {
    CollectionView()
        .environment(CartManager())
}

struct SmallProductCard: View {
    @Environment(CartManager.self) var cartManager
    var product:ProductModel
    var body: some View {
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -110)
                .rotationEffect(Angle(degrees: 30))
            
            ZStack{
                VStack(alignment: .leading){
                    Text(product.name)
                        .font(.system(size: 20,weight: .semibold))
                        .frame(width: 80)
                    
                    Text(product.category)
                        .font(.system(size:10))
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack{
                        Text("$\(product.price).0")
                            .font(.system(size:14, weight: .semibold))
                        Spacer()
                        Button{
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width:70,height:40)
                                 .background(.black)
                                .clipShape(Capsule())
                                .foregroundStyle(.white)
                                
                        }
                    }
                    .padding(.trailing,-12)
                    .padding()
                    .frame(maxWidth:.infinity)
                    .frame(height:45)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                }
                
            }
            .padding()
            .frame(width:170,height: 215)
        }
        .frame(width:170,height: 215)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.leading,10)
    }
}
