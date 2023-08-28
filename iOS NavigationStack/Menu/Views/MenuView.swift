//
//  MenuView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 03/02/2023.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject private var cartManager = ShoppingCartManager()
    @StateObject private var routeManager = RouteManager()
    
    var body: some View {
        
        NavigationStack(path: $routeManager.routes) {
            
            List {
                
                Section("Foods") {
                    ForEach(foods) { food in
                        
                        NavigationLink(value: Route.menuItem(item: food)) {
                            MenuItemView(item: food)
                        }
                    }
                }
                
                Section("Drinks") {
                    ForEach(drinks) { drink in
                        
                        NavigationLink(value: Route.menuItem(item: drink)) {
                            MenuItemView(item: drink)
                        }
                    }
                }
                
                Section("Desserts") {
                    ForEach(desserts) { dessert in
                        
                        NavigationLink(value: Route.menuItem(item: dessert)) {
                            MenuItemView(item: dessert)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    CartButton(count: cartManager.getGroupedCart().count) {
                        routeManager.push(to: .cart)
                    }
                }
            }
            .navigationTitle("Menu")
            .navigationDestination(for: Route.self) { $0 }
            
        }
        .environmentObject(cartManager)
        .environmentObject(routeManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(ShoppingCartManager())
            .environmentObject(RouteManager())
    }
}
