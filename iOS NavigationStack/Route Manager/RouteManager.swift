//
//  NavigationRouter.swift
//  iOS NavigationStack
//
//  Created by Junaed Muhammad Chowdhury on 26/8/23.
//

import Foundation
import SwiftUI



final class RouteManager: ObservableObject {
    @Published var routes = [Route]()
    
    func push(to screen: Route){
        routes.append(screen)
    }
    
    
    func reset(){
        routes = []
    }
}

