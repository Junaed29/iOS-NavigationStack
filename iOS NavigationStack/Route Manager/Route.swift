//
//  Route.swift
//  iOS NavigationStack
//
//  Created by Junaed Muhammad Chowdhury on 26/8/23.
//

import Foundation
import SwiftUI


enum Route{
    case menuItem (item: any MenuItem)
    case cart
    case ingredients(items: [Ingredient])
    case allergies(item: [Allergie])
}


//MARK: - Hashable Protocols

extension Route: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs){
            
        case (.menuItem(let lhsItem), .menuItem(let rhsItem)):
            return lhsItem.id == rhsItem.id
            
        case (.cart, .cart):
            return true
            
        case (.ingredients(let lhsItem), .ingredients(let rhsItem)):
            return lhsItem == rhsItem
            
         case (.allergies(let lhsItem), .allergies(let rhsItem)):
            return lhsItem == rhsItem
            
        default:
            return false
        }
    }
}


//MARK: - View Protocols

extension Route: View{
    
    var body: some View{
        switch self {
        case .menuItem(let menuItem):
            switch menuItem{
            case is Food:
                FoodDetailView(food: menuItem as! Food)
             case is Drink:
               DrinkDetailView(drink: menuItem as! Drink)
             case is Dessert:
                DessertDetailView(dessert: menuItem as! Dessert)
                
            default:
                EmptyView()
            }

        case .cart:
            CartView()
        case .ingredients(items: let items):
            IngredientsDetailView(ingredients: items)
        case .allergies(item: let item):
            AllergiesDetailView(allergies: item)
        }
    }
}
