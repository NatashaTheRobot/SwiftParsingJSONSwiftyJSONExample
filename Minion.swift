//
//  Minion.swift
//  SwiftParsingJSONExample
//
//  Created by Natasha Murashev on 7/16/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class Minion {
   
    var name: String?
    var numberOfEyes: Int?
    var height: Int?
    var hair: String?
    var loves: String?
    var hates: String?
    var movieMoment: String?
    
    class func fetchMinionData() -> [Minion] {
        let dataFileName = "minionsArray"
        
        let dataURL = NSBundle.mainBundle().URLForResource(dataFileName, withExtension: "json")!
        
        var dataError: NSError?
        let data = NSData(contentsOfURL: dataURL, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &dataError)
        
        let minionJSON = JSONValue(data)
        
        var minions = [Minion]()
        
        for minionDictionary in minionJSON {
            minions.append(Minion(minionDetails: minionDictionary))
        }
        
        return minions
    }
    
    init(minionDetails: JSONValue) {
        
        self.name = minionDetails["name"].string
        
        if let traits = minionDetails["traits"].object {
            numberOfEyes = traits["numberOfEyes"]?.integer
            height = traits["height"]?.integer
            hair = traits["hair"]?.string
            loves = traits["loves"]?.string
            hates = traits["hates"]?.string
        }
        
        movieMoment = minionDetails["movie_moment"].string
        
    }
    
}
