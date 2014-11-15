//
//  Grocery.swift
//  CollegeLyfe
//
//  Created by Alex Rich on 11/14/14.
//  Copyright (c) 2014 Alex Rich and Jessica Szejer. All rights reserved.
//

import Foundation

class Grocery {
    var items: Array<String>
    var totalToSpend = 0
    var possibleCombos: [(name: String, value: Int)]
    
    
    init () {
        self.items = []
        self.totalToSpend = 0
        self.possibleCombos = []
    }
    
    init (items: Array<String>, totalToSpend: Int) {
        self.items = items
        self.totalToSpend = totalToSpend
        var list = generateCombos()
        self.possibleCombos = list
    }
    
    func setSpendingLimit(newLimit: Int) {
        self.totalToSpend = newLimit
    }
    
    func addItem(newItem: String) {
        self.items.append(newItem)
    }
    
    func removeItems() {
        items = []
    }
    
    func generateCombos(items: [String], ) -> [(name: String, value: Int)] {
        // Generates a list of tuples of the possible combinations one can get.
        if
    }
    
}