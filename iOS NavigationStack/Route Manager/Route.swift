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
            
        }
    }
}
