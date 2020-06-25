//
//  Sandwich.swift
//  sandwiches
//
//  Created by Srinivas Prabhu G on 25/06/20.
//

import Foundation

struct Sandwich : Identifiable  {
    let id = UUID()
    let name:String
    let imagename:String
    let ingredientCount:Int
    let isSpicy:Bool
    var imageName:String { return imagename}
    var thumbnailName:String { return imagename + "Thumb"}
}

let testData = [
    Sandwich(name: "Baked Bread",imagename:"bakedbread" , ingredientCount: 4, isSpicy: true),
    Sandwich(name: "Grilled White Cheese Sandwich",imagename: "grilledwhitecheesesandwich", ingredientCount: 5, isSpicy: true),
    Sandwich(name: "Sweet Chilli Turkey",imagename: "sweetchilliturkey", ingredientCount: 6, isSpicy: false),
    Sandwich(name: "Meat Sandwich",imagename: "meatsandwich", ingredientCount: 4, isSpicy: true),
    Sandwich(name: "Spinach",imagename: "spinach", ingredientCount: 3, isSpicy: false),
    Sandwich(name: "Vegan",imagename: "vegan", ingredientCount: 2, isSpicy: false),
];

