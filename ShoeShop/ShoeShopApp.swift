//
//  ShoeShopApp.swift
//  ShoeShop
//
//  Created by CamL on 06/05/2022.
//

import SwiftUI

@main
struct ShoeShopApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
