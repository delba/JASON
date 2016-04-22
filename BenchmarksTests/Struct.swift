//
//  Struct.swift
//  Benchmarks
//
//  Created by Damien on 22/04/2016.
//  Copyright © 2016 Damien. All rights reserved.
//

import JASON
import SwiftyJSON

struct Struct {
    let string: String
    let int: Int
    let double: Double
    let float: Float
    let bool: Bool
    let array: [AnyObject]
    let dictionary: [String: AnyObject]
    let optionalFloat: Float?
    let optionalString: String?
    let optionalInt: Int?
    let optionalDouble: Double?
    let optionalBool: Bool?
    let optionalArray: [AnyObject]?
    let optionalDictionary: [String: AnyObject]?
    
    init(jason json: JASON.JSON) {
        string = json["string"].stringValue
        int = json["int"].intValue
        double = json["double"].doubleValue
        float = json["float"].floatValue
        bool = json["bool"].boolValue
        array = json["array"].arrayValue
        dictionary = json["dictionary"].dictionaryValue
        optionalString = json["string"].string
        optionalInt = json["int"].int
        optionalDouble = json["double"].double
        optionalFloat = json["float"].float
        optionalBool = json["bool"].bool
        optionalArray = json["array"].array
        optionalDictionary = json["dictionary"].dictionary
    }
    
    init(swityJson json: SwiftyJSON.JSON) {
        string = json["string"].stringValue
        int = json["int"].intValue
        double = json["double"].doubleValue
        float = json["float"].floatValue
        bool = json["bool"].boolValue
        array = json["array"].arrayObject ?? [AnyObject]()
        dictionary = json["dictionary"].dictionaryObject ?? [String: AnyObject]()
        optionalString = json["string"].string
        optionalInt = json["int"].int
        optionalDouble = json["double"].double
        optionalFloat = json["float"].float
        optionalBool = json["bool"].bool
        optionalArray = json["array"].arrayObject
        optionalDictionary = json["dictionary"].dictionaryObject
    }
}

