//
//  Home.swift
//  SnackShopApp
//
//  Created by APPLE on 03/08/24.
//

import SwiftUI

struct Home: View {
    @Environment(CartManager.self) var cartManager
    @State var selectedCategory = "Choco"
    @State var categoryItem = Category()
    @State var productItem = Product()
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    HStack{
                        Text("Order From The Best OF **Snacks**")
                            .font(.system(size:30))
                            .padding(.trailing)
                        Spacer()
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width:70,height:90)
                            .overlay(RoundedRectangle(cornerRadius:50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    //CategoryListView
                    CategoryListView
                    
                    //Collection View
                    HStack{
                        Text("Choco **Collection**")
                            .font(.system(size:24))
                        
                        Spacer()
                        
                        NavigationLink{
                            CollectionView()
                                .environment(cartManager)
                        } label: {
                            Image(systemName:"arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal,30)
                    .padding(.vertical,15)
                    
                    //Product List
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(productItem.productList,id:\.id){ item in
                                ProductCard(product: item)
                                    .environment(cartManager)
                            }
                        }
                        .padding(.leading)
                    }
                }
            }
            
        }
    }
    
    //CategoryList
    var CategoryListView: some View{
        HStack{
            ScrollView(.horizontal,showsIndicators: false){
                HStack {
                    ForEach(categoryItem.categoryList,id:\.id){ item in
                        Button{
                            selectedCategory = item.title
                        } label: {
                            HStack{
                                if item.title != "All" {
                                    Image(item.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                                        .frame(width:35,height: 35)
    
                                }
                                Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .clipShape(.capsule)
                        }
                        
                    }
                }
            }
        }
        .padding(.horizontal,20)
    }
}

#Preview {
    Home()
        .environment(CartManager())
}

//Product Card View
struct ProductCard: View {
    @Environment(CartManager.self) var cartManager
    var product:ProductModel
    var body: some View {
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing,-200)
                .rotationEffect(Angle(degrees: 30))
        ZStack{
                VStack(alignment: .leading,content: {
                    Text("\(product.name)")
                        .font(.system(size:36,weight:.semibold))
                        .frame(width:140)
                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    Spacer()
                    
                    HStack{
                        Text("$\(product.price)")
                            .font(.system(size:24,weight: .semibold))
                        Spacer()
                        
                        Button{
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 90,height:68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundStyle(.white)
                        }
                        .padding(.horizontal, -10)
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth:.infinity)
                    .frame(height:80)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                })
            }
        .padding(30)
        .frame(width:336,height:422)
        }
        .frame(width:336,height:422)
        .background(product.color.opacity(0.2))
        .clipShape(.rect(cornerRadius:57))
        .padding(.leading, 20)
    }
}
