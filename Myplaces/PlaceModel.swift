//
//  PlaceModel.swift
//  Myplaces
//
//  Created by user on 19/04/22.
//

import RealmSwift

class Place {
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var  type: String?
    @objc dynamic var  imageData: Data?
    @objc dynamic var  restarauntImage: String?
    
   static let restorauntNames = [
        "Burger Heroes" , "Kitchen","Bonsai","Дастархан",
        "Индокитай","X.O","Балкан Гриль","Sherlock Holmes",
        "Speak Easy", "Morris Pub","Вкусные истории",
        "Классик","Love&Life","Шок","Бочка"
    ]
    // static => Struct property  ==> Struct.staticValue
   static func savePlaces()  {
        
         // evere item in RestarauntName we add in places arr
        for place in restorauntNames {
        let image  = UIImage(named: place)
            guard let imageData = image?.pngData() else {return}
//            pngData  img to Data
            let newPlace = Place()
            newPlace.name = place
            newPlace.location = "ufa"
            newPlace.type = "bar"
            newPlace.imageData = imageData
            
            
        }
    }

}
