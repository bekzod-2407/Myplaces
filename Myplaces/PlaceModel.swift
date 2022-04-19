//
//  PlaceModel.swift
//  Myplaces
//
//  Created by user on 19/04/22.
//

import Foundation

struct Place {
    var name: String
    var location: String
    var type: String
    var image: String
    
   static let restorauntNames = [
        "Burger Heroes" , "Kitchen","Bonsai","Дастархан",
        "Индокитай","X.O","Балкан Гриль","Sherlock Holmes",
        "Speak Easy", "Morris Pub","Вкусные истории",
        "Классик","Love&Life","Шок","Бочка"
    ]
    // static => Struct property  ==> Struct.staticValue
   static func getPlaces() -> [Place]  {
        
        var places = [Place]()
         // evere item in RestarauntName we add in places arr
        for place in restorauntNames {
            places.append(Place(name: place, location: "Tashkent", type: "Restoraunt", image: place ))
        }
        return places
    }

}
