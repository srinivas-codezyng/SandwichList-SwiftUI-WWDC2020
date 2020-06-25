//
//  SandwichStore.swift
//  sandwiches
//
//  Created by Srinivas Prabhu G on 25/06/20.
//

import Foundation

class SandwichStore: ObservableObject {
    @Published var sandwiches:[Sandwich]
    
    init(sandwiches:[Sandwich] = []) {
        self.sandwiches = sandwiches
    }
}

let testStore = SandwichStore(sandwiches: testData)
