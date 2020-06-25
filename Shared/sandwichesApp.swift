//
//  sandwichesApp.swift
//  Shared
//
//  Created by Srinivas Prabhu G on 25/06/20.
//

import SwiftUI

@main
struct sandwichesApp: App {
    @StateObject private var store = SandwichStore(sandwiches: testStore.sandwiches)
    
    var body: some Scene {
        WindowGroup {
            SandwichList(store: store)
        }
    }
}
