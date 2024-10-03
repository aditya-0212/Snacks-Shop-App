//
//  CategoryModel.swift
//  SnackShopApp
//
//  Created by APPLE on 03/08/24.
//

import SwiftUI

struct CategoryModel:Identifiable,Hashable{
    var id: UUID = .init()
    var icon: String
    var title: String
}

//var categoryList: [CategoryModel] = [
//       CategoryModel(icon: "", title: "All"),
//       CategoryModel(icon:"choco",title:"Choco"),
//       CategoryModel(icon: "wafles", title: "Waffles"),
//       CategoryModel(icon:"toffee",title:"Toffee")
//]

@Observable
class Category{
    var categoryList:[CategoryModel] = [
        CategoryModel(icon: "", title: "All"),
        CategoryModel(icon:"choco",title:"Choco"),
        CategoryModel(icon: "wafles", title: "Waffles"),
        CategoryModel(icon:"toffee",title:"Toffee")
    ]
}
