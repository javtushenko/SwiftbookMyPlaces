//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Николай Явтушенко on 11.01.2022.
//

import UIKit

struct Place {
    
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    var restaurantImage: String?
    
    
    
    static let restaurantNames = ["Burger King", "McDonalds", "KFC", "Сушкофф",
                           "Китайская столовая", "Белый рынок", "Dodo Pizza"]
    
    static func getPlaces() -> [Place] {
        
        var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "Челябинск", type: "Ресторан", image: nil, restaurantImage: place))
        }
        
        return places
    }
    
    
    
}
