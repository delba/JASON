//
//  JASONTests.swift
//
//  Copyright (c) 2016 Damien (http://delba.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit
import XCTest
import JASON

extension Keys {
    static let string = Key<String>("string")
    static let optionalString = Key<String?>("optionalString")
    static let int = Key<Int>("int")
    static let optionalInt = Key<Int?>("optionalInt")
    static let double = Key<Double>("double")
    static let optionalDouble = Key<Double?>("optionalDouble")
    static let float = Key<Float>("float")
    static let optionalFloat = Key<Float?>("optionalFloat")
    static let bool = Key<Bool>("bool")
    static let optionalBool = Key<Bool?>("optionalBool")
    static let array = Key<[AnyObject]>("array")
    static let optionalArray = Key<[AnyObject]?>("optionalArray")
    static let dictionary = Key<[String: AnyObject]>("dictionary")
    static let optionalDictionary = Key<[String: AnyObject]>("optionalDictionary")
    static let arrayJSON = Key<[JSON]>("arrayJSON")
    static let optionalArrayJSON = Key<[JSON]?>("optionalArrayJSON")
    static let dictionaryJSON = Key<[String: JSON]>("dictionaryJSON")
    static let optinoalDictionaryJSON = Key<[String: JSON]?>("optionalDictionaryJSON")
}


class JASONTests: XCTestCase {
    
    func testStaticSubscripts() {
        let json: JSON = [
            "string": "string",
            "optionalString": "string",
            "int": 42,
            "optionalInt": 42,
            "double": 4.2,
            "optionalDouble": 4.2,
            "float": 4.2,
            "optionalFloat": 4.2,
            "bool": true,
            "optionalBool": true,
            "array": ["string", 42, 4.2, true],
            "optionalArray": ["string", 42, 4.2, true],
            "dictionary": ["string": 42],
            "optionalDictionary": ["string": 42],
        ]
        
        XCTAssertEqual("string", json[.string])
        XCTAssertEqual("string", json[.optionalString])
        XCTAssertEqual(42, json[.int])
        XCTAssertEqual(42, json[.optionalInt])
        XCTAssertEqual(4.2, json[.double])
        XCTAssertEqual(4.2, json[.optionalDouble])
        XCTAssertEqual(4.2, json[.float])
        XCTAssertEqual(4.2, json[.optionalFloat])
        XCTAssertEqual(true, json[.bool])
        XCTAssertEqual(true, json[.optionalBool])
        XCTAssertEqualArrays(["string", 42, 4.2, true], json[.array])
        XCTAssertEqualArrays(["string", 42, 4.2, true], json[.optionalArray]!)
        XCTAssertEqualDictionaries(["string": 42], json[.dictionary])
        XCTAssertEqualDictionaries(["string": 42], json[.optionalDictionary])
    }

    func testInitWithObject() {
        let object: AnyObject = ["name": "Brandon Walsh"]
        let json = JSON(object)
        XCTAssertEqualDictionaries(object as! [String: AnyObject], json.dictionaryValue)
    }

    func testInitWithData() {
        if let path = NSBundle(forClass: JASONTests.self).pathForResource("JASON", ofType: "json") {
            let data: NSData?
            do {
                data = try NSData(contentsOfFile: path, options: [])
            } catch _ {
                data = nil
            }
            let json = JSON(data)
            XCTAssertEqual("Brandon Walsh", json["name"].stringValue)
        } else {
            XCTFail("JASON.json doesn't exist.")
        }
    }

    func testSubscriptWithString() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "age": 17
        ]

        json[42]
    }

    func testSubscriptWithInt() {

    }

    func testString() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "age": 17
        ]

        // Value is present and convertible
        XCTAssertEqual("Brandon Walsh", json["name"].string!)
        XCTAssertEqual("Brandon Walsh", json["name"].stringValue)

        // Value is not present
        XCTAssertNil(json["nickname"].string)
        XCTAssertEqual("", json["nickname"].stringValue)

        // Value is not convertible
        XCTAssertNil(json["age"].string)
        XCTAssertEqual("", json["age"].stringValue)
    }

    func testIntegerType() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "age": 17
        ]

        // Value is present and convertible

        XCTAssertEqual(17, json["age"].int!)
        XCTAssertEqual(17, json["age"].intValue)

        // Value is not present

        XCTAssertNil(json["romances_count"].int)
        XCTAssertEqual(0, json["romances_count"].intValue)

        // Value is not convertible

        XCTAssertNil(json["name"].int)
        XCTAssertEqual(0, json["name"].intValue)
    }

    func testFloatingPointType() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "age": 17
        ]

        // Value is present and convertible

        XCTAssertEqual(Double(17), json["age"].double!)
        XCTAssertEqual(Double(17), json["age"].doubleValue)

        XCTAssertEqual(Float(17), json["age"].float!)
        XCTAssertEqual(Float(17), json["age"].floatValue)

        // Value is not present

        XCTAssertNil(json["romances_count"].double)
        XCTAssertEqual(Double(0), json["romances_count"].doubleValue)

        XCTAssertNil(json["romances_count"].float)
        XCTAssertEqual(Float(0), json["romances_count"].floatValue)

        // VAlue is not convertible

        XCTAssertNil(json["name"].double)
        XCTAssertEqual(Double(0), json["name"].doubleValue)

        XCTAssertNil(json["name"].float)
        XCTAssertEqual(Float(0), json["name"].floatValue)
    }

    func testBool() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "age": 17,
            "cool": true
        ]

        // Value is present and convertible

        XCTAssert(json["cool"].bool!)
        XCTAssert(json["cool"].boolValue)

        // Value is not present

        XCTAssertNil(json["swaggy"].bool)
        XCTAssertFalse(json["swaggy"].boolValue)

        // Value is not convertible

        XCTAssertNil(json["name"].bool)
        XCTAssertFalse(json["name"].boolValue)
    }

    func testDictionary() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "mother": [
                "name": "Cindy Walsh"
            ]
        ]

        // Value is present and convertible

        XCTAssertEqualDictionaries(["name": "Cindy Walsh"], json["mother"].dictionary!)
        XCTAssertEqualDictionaries(["name": "Cindy Walsh"], json["mother"].dictionaryValue)

        // Value is not present

        XCTAssertNil(json["father"].dictionary)
        XCTAssertEqualDictionaries([String: AnyObject](), json["father"].dictionaryValue)

        // Value is not convertible

        XCTAssertNil(json["name"].dictionary)
        XCTAssertEqualDictionaries([String: AnyObject](), json["name"].dictionaryValue)
    }
    
    func testJsonDictionary() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "mother": [
                "name": "Cindy Walsh"
            ]
        ]
        
        var key: String
        
        // Value is present and convertible
        
        key = "mother"
        XCTAssertEqual("Cindy Walsh", json[key].jsonDictionary!["name"]!.string!)
        XCTAssertEqual("Cindy Walsh", json[key].jsonDictionaryValue["name"]!.stringValue)
        
        // Value is not present
        
        key = "father"
        XCTAssert(json[key].jsonDictionary == nil)
        XCTAssert(json[key].dictionaryValue.isEmpty)
        
        // Value is not convertible
        
        key = "name"
        XCTAssert(json[key].jsonDictionary == nil)
        XCTAssert(json[key].jsonDictionaryValue.isEmpty)
    }

    func testArray() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "friends": ["Steve Sanders", "Dylan McKay"]
        ]

        // Value is present and convertible

        XCTAssertEqualArrays(["Steve Sanders", "Dylan McKay"], json["friends"].array!)
        XCTAssertEqualArrays(["Steve Sanders", "Dylan McKay"], json["friends"].arrayValue)

        // Value is not present

        XCTAssertNil(json["romances"].array)
        XCTAssertEqualArrays([AnyObject](), json["romances"].arrayValue)

        // Value is not convertible

        XCTAssertNil(json["name"].array)
        XCTAssertEqualArrays([AnyObject](), json["name"].arrayValue)
    }
    
    func testJsonArray() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "friends": ["Steve Sanders", "Dylan McKay"]
        ]
        
        // Value is present and convertible
        
        XCTAssertEqualArrays(["Steve Sanders", "Dylan McKay"], json["friends"].jsonArray!.map{$0.stringValue})
        XCTAssertEqualArrays(["Steve Sanders", "Dylan McKay"], json["friends"].jsonArrayValue.map{$0.stringValue})
        
        // Value is not present
        
        XCTAssert(json["romances"].jsonArray == nil)
        XCTAssert(json["romances"].jsonArrayValue.isEmpty)
        
        // Value is not convertible
        
        XCTAssert(json["name"].jsonArray == nil)
        XCTAssert(json["name"].jsonArrayValue.isEmpty)
    }

    func testStringOperators() {
        var string: String = "Brandon Walsh"
        var optionalString: String?
        var unwrappedString: String!

        // The <| operator

        string <| JSON(nil)
        XCTAssertEqual("Brandon Walsh", string)
        string <| JSON("Brenda Walsh")
        XCTAssertEqual("Brenda Walsh", string)

        optionalString <| JSON("Brenda Walsh")
        XCTAssertEqual("Brenda Walsh", optionalString!)
        optionalString <| JSON(nil)
        XCTAssertEqual("Brenda Walsh", optionalString!)

        unwrappedString <| JSON("Brenda Walsh")
        XCTAssertEqual("Brenda Walsh", unwrappedString)
        unwrappedString <| JSON(nil)
        XCTAssertEqual("Brenda Walsh", unwrappedString)

        // The <? operator

        optionalString <? JSON("Brandon Walsh")
        XCTAssertEqual("Brandon Walsh", optionalString!)
        optionalString <? JSON(nil)
        XCTAssertNil(optionalString)

        unwrappedString <? JSON(nil)
        XCTAssertNil(unwrappedString)
        unwrappedString <? JSON("Brandon Walsh")
        XCTAssertEqual("Brandon Walsh", unwrappedString)

        // The <! operator

        string <! JSON(nil)
        XCTAssertEqual("", string)
        string <! JSON("Brandon Walsh")
        XCTAssertEqual("Brandon Walsh", string)

        optionalString <! JSON(nil)
        XCTAssertEqual("", optionalString!)
        optionalString <! JSON("Brandon Walsh")
        XCTAssertEqual("Brandon Walsh", optionalString!)

        unwrappedString <! JSON(nil)
        XCTAssertEqual("", unwrappedString)
        unwrappedString <! JSON("Brandon Walsh")
        XCTAssertEqual("Brandon Walsh", unwrappedString)
    }

    func testIntegerOperators() {
        var int: Int = 42
        var optionalInt: Int?
        var unwrappedInt: Int!

        // The <| operator

        int <| JSON(nil)
        XCTAssertEqual(42, int)
        int <| JSON(17)
        XCTAssertEqual(17, int)

        optionalInt <| JSON(42)
        XCTAssertEqual(42, optionalInt!)
        optionalInt <| JSON(nil)
        XCTAssertEqual(42, optionalInt!)

        unwrappedInt <| JSON(42)
        XCTAssertEqual(42, unwrappedInt)
        unwrappedInt <| JSON(nil)
        XCTAssertEqual(42, unwrappedInt)

        // The <? operator

        optionalInt <? JSON(17)
        XCTAssertEqual(17, optionalInt!)
        optionalInt <? JSON(nil)
        XCTAssertNil(optionalInt)

        unwrappedInt <? JSON(42)
        XCTAssertEqual(42, unwrappedInt)
        unwrappedInt <? JSON(nil)
        XCTAssertNil(unwrappedInt)

        // The <! operator

        int <! JSON(nil)
        XCTAssertEqual(0, int)
        int <! JSON(42)
        XCTAssertEqual(42, int)

        optionalInt <! JSON(nil)
        XCTAssertEqual(0, optionalInt!)
        optionalInt <! JSON(42)
        XCTAssertEqual(42, optionalInt!)

        unwrappedInt <! JSON(nil)
        XCTAssertEqual(0, unwrappedInt)
        unwrappedInt <! JSON(17)
        XCTAssertEqual(17, unwrappedInt)
    }

    func testFloatingPointTypeOperators() {
        var double: Double = 42
        var optionalDouble: Double?
        var unwrappedDouble: Double!

        // The <| operator

        double <| JSON(nil)
        XCTAssertEqual(42, double)
        double <| JSON(17)
        XCTAssertEqual(17, double)

        optionalDouble <| JSON(42)
        XCTAssertEqual(42, optionalDouble!)
        optionalDouble <| JSON(nil)
        XCTAssertEqual(42, optionalDouble!)

        unwrappedDouble <| JSON(42)
        XCTAssertEqual(42, unwrappedDouble)
        unwrappedDouble <| JSON(nil)
        XCTAssertEqual(42, unwrappedDouble)

        // The <? operator

        optionalDouble <? JSON(17)
        XCTAssertEqual(17, optionalDouble!)
        optionalDouble <? JSON(nil)
        XCTAssertNil(optionalDouble)

        unwrappedDouble <? JSON(17)
        XCTAssertEqual(17, unwrappedDouble)
        unwrappedDouble <? JSON(nil)
        XCTAssertNil(unwrappedDouble)

        // The <! operator

        double <! JSON(nil)
        XCTAssertEqual(0, double)
        double <! JSON(42)
        XCTAssertEqual(42, double)

        optionalDouble <! JSON(nil)
        XCTAssertEqual(0, optionalDouble!)
        optionalDouble <! JSON(42)
        XCTAssertEqual(42, optionalDouble!)

        unwrappedDouble <! JSON(nil)
        XCTAssertEqual(0, unwrappedDouble)
        unwrappedDouble <! JSON(17)
        XCTAssertEqual(17, unwrappedDouble)

        var float: Float = 42
        var optionalFloat: Float?
        var unwrappedFloat: Float!

        // The <| operator

        float <| JSON(nil)
        XCTAssertEqual(42, float)
        float <| JSON(17)
        XCTAssertEqual(17, float)

        optionalFloat <| JSON(42)
        XCTAssertEqual(42, optionalFloat!)
        optionalFloat <| JSON(nil)
        XCTAssertEqual(42, optionalFloat!)

        unwrappedFloat <| JSON(42)
        XCTAssertEqual(42, unwrappedFloat)
        unwrappedFloat <| JSON(nil)
        XCTAssertEqual(42, unwrappedFloat)

        // The <? operator

        optionalFloat <? JSON(17)
        XCTAssertEqual(17, optionalFloat!)
        optionalFloat <? JSON(nil)
        XCTAssertNil(optionalFloat)

        unwrappedFloat <? JSON(17)
        XCTAssertEqual(17, unwrappedFloat)
        unwrappedFloat <? JSON(nil)
        XCTAssertNil(unwrappedFloat)

        // The <! operator

        float <! JSON(nil)
        XCTAssertEqual(0, float)
        float <! JSON(42)
        XCTAssertEqual(42, float)

        optionalFloat <! JSON(nil)
        XCTAssertEqual(0, optionalFloat!)
        optionalFloat <! JSON(42)
        XCTAssertEqual(42, optionalFloat!)


        unwrappedFloat <! JSON(nil)
        XCTAssertEqual(0, unwrappedFloat)
        unwrappedFloat <! JSON(17)
        XCTAssertEqual(17, unwrappedFloat)
    }

    func testBoolOperators() {
        var bool: Bool = true
        var optionalBool: Bool?
        var unwrappedBool: Bool!

        // The <| operator

        bool <| JSON(nil)
        XCTAssertEqual(true, bool)
        bool <| JSON(false)
        XCTAssertEqual(false, bool)

        optionalBool <| JSON(true)
        XCTAssertEqual(true, optionalBool!)
        bool <| JSON(nil)
        XCTAssertEqual(true, optionalBool!)

        unwrappedBool <| JSON(true)
        XCTAssertEqual(true, unwrappedBool)
        bool <| JSON(nil)
        XCTAssertEqual(true, unwrappedBool)

        // The <? operator

        optionalBool <? JSON(true)
        XCTAssertEqual(true, optionalBool!)
        optionalBool <? JSON(nil)
        XCTAssertNil(optionalBool)

        unwrappedBool <? JSON(true)
        XCTAssertEqual(true, unwrappedBool)
        unwrappedBool <? JSON(nil)
        XCTAssertNil(unwrappedBool)

        // The <! operator

        bool <! JSON(nil)
        XCTAssertEqual(false, bool)
        bool <! JSON(true)
        XCTAssertEqual(true, bool)

        optionalBool <! JSON(nil)
        XCTAssertEqual(false, optionalBool!)
        optionalBool <! JSON(true)
        XCTAssertEqual(true, optionalBool!)

        unwrappedBool <! JSON(nil)
        XCTAssertEqual(false, unwrappedBool)
        unwrappedBool <! JSON(true)
        XCTAssertEqual(true, unwrappedBool)
    }

    func testDictionaryOperators() {
        var dictionary: [String: AnyObject] = ["name": "Brandon Walsh"]
        var optionalDictionary: [String: AnyObject]?
        var unwrappedDictionary: [String: AnyObject]!

        // The <| operator

        dictionary <| JSON(nil)
        XCTAssertEqualDictionaries(["name": "Brandon Walsh"], dictionary)
        dictionary <| JSON(["name": "Brenda Walsh"])
        XCTAssertEqualDictionaries(["name": "Brenda Walsh"], dictionary)

        optionalDictionary <| JSON(["name": "Brenda Walsh"])
        XCTAssertEqualDictionaries(["name": "Brenda Walsh"], optionalDictionary!)
        optionalDictionary <| JSON(nil)
        XCTAssertEqualDictionaries(["name": "Brenda Walsh"], optionalDictionary!)

        unwrappedDictionary <| JSON(["name": "Brenda Walsh"])
        XCTAssertEqualDictionaries(["name": "Brenda Walsh"], unwrappedDictionary)
        unwrappedDictionary <| JSON(nil)
        XCTAssertEqualDictionaries(["name": "Brenda Walsh"], unwrappedDictionary)

        // The <? operator

        optionalDictionary <? JSON(["name": "Brenda Walsh"])
        XCTAssertEqualDictionaries(["name": "Brenda Walsh"], optionalDictionary!)
        optionalDictionary <? JSON(nil)
        XCTAssertNil(optionalDictionary)

        unwrappedDictionary <? JSON(["name": "Brenda Walsh"])
        XCTAssertEqualDictionaries(["name": "Brenda Walsh"], unwrappedDictionary)
        unwrappedDictionary <? JSON(nil)
        XCTAssertNil(unwrappedDictionary)

        // The <! operator

        dictionary <! JSON(["name": "Brenda Walsh"])
        XCTAssertEqualDictionaries(["name": "Brenda Walsh"], dictionary)
        dictionary <! JSON(nil)
        XCTAssertEqualDictionaries([String: AnyObject](), dictionary)

        optionalDictionary <! JSON(["name": "Brenda Walsh"])
        XCTAssertEqualDictionaries(["name": "Brenda Walsh"], optionalDictionary!)
        optionalDictionary <! JSON(nil)
        XCTAssertEqualDictionaries([String: AnyObject](), optionalDictionary!)

        unwrappedDictionary <! JSON(["name": "Brenda Walsh"])
        XCTAssertEqualDictionaries(["name": "Brenda Walsh"], unwrappedDictionary)
        unwrappedDictionary <! JSON(nil)
        XCTAssertEqualDictionaries([String: AnyObject](), unwrappedDictionary)
    }

    func testArrayOperators() {
        var array: [AnyObject] = ["Steve Sanders", "Dylan McKay"]
        var optionalArray: [AnyObject]?
        var unwrappedArray: [AnyObject]!

        // The <| operator

        array <| JSON(nil)
        XCTAssertEqualArrays(["Steve Sanders", "Dylan McKay"], array)
        array <| JSON(["Kelly Taylor", "Nikki Witt"])
        XCTAssertEqualArrays(["Kelly Taylor", "Nikki Witt"], array)

        optionalArray <| JSON(["Kelly Taylor", "Nikki Witt"])
        XCTAssertEqualArrays(["Kelly Taylor", "Nikki Witt"], optionalArray!)
        optionalArray <| JSON(nil)
        XCTAssertEqualArrays(["Kelly Taylor", "Nikki Witt"], optionalArray!)

        unwrappedArray <| JSON(["Kelly Taylor", "Nikki Witt"])
        XCTAssertEqualArrays(["Kelly Taylor", "Nikki Witt"], unwrappedArray)
        unwrappedArray <| JSON(nil)
        XCTAssertEqualArrays(["Kelly Taylor", "Nikki Witt"], unwrappedArray)

        // The <? operator

        optionalArray <? JSON(["Kelly Taylor", "Nikki Witt"])
        XCTAssertEqualArrays(["Kelly Taylor", "Nikki Witt"], optionalArray!)
        optionalArray <? JSON(nil)
        XCTAssertNil(optionalArray)

        unwrappedArray <? JSON(["Kelly Taylor", "Nikki Witt"])
        XCTAssertEqualArrays(["Kelly Taylor", "Nikki Witt"], unwrappedArray)
        unwrappedArray <? JSON(nil)
        XCTAssertNil(unwrappedArray)

        // The <! operator

        array <! JSON(["Kelly Taylor", "Nikki Witt"])
        XCTAssertEqualArrays(["Kelly Taylor", "Nikki Witt"], array)
        array <! JSON(nil)
        XCTAssertEqualArrays([AnyObject](), array)

        optionalArray <! JSON(["Kelly Taylor", "Nikki Witt"])
        XCTAssertEqualArrays(["Kelly Taylor", "Nikki Witt"], optionalArray!)
        optionalArray <! JSON(nil)
        XCTAssertEqualArrays([AnyObject](), optionalArray!)

        unwrappedArray <! JSON(["Kelly Taylor", "Nikki Witt"])
        XCTAssertEqualArrays(["Kelly Taylor", "Nikki Witt"], unwrappedArray)
        unwrappedArray <! JSON(nil)
        XCTAssertEqualArrays([AnyObject](), unwrappedArray)
    }

    func testSequences() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "friends": ["Steve Sanders", "Dylan McKay"]
        ]

        let names = json["friends"].map {$0.stringValue}
        XCTAssertEqualArrays(["Steve Sanders", "Dylan McKay"], names)
    }

    func testStringLiteralConvertible() {
        let json: JSON = "Brandon Walsh"
        XCTAssertEqual("Brandon Walsh", json.stringValue)
    }

    func testIntegerLiteralConvertible() {
        let json: JSON = 17
        XCTAssertEqual(17, json.intValue)
    }

    func testFloatLiteralConvertible() {
        let json: JSON = 01.23
        XCTAssertEqual(01.23, json.floatValue)
        XCTAssertEqual(01.23, json.doubleValue)
    }

    func testBooleanLiteralConvertible() {
        let json: JSON = true
        XCTAssertEqual(true, json.boolValue)
    }

    func testArrayLiteralConvertible() {
        let json: JSON = ["Steve Sanders", "Dylan McKay"]
        XCTAssertEqualArrays(["Steve Sanders", "Dylan McKay"], json.arrayValue)
    }

    func testDictionaryLiteralConvertible() {
        let json: JSON = ["name": "Brandon Walsh"]
        XCTAssertEqualDictionaries(["name": "Brandon Walsh"], json.dictionaryValue)
    }

    func testNilLiteralConvertible() {
        let json: JSON = nil
        XCTAssert(json.object == nil)
    }
}

private extension XCTestCase {
    func XCTAssertEqualDictionaries(lhs: [String: AnyObject], _ rhs: [String: AnyObject]) {
        XCTAssertEqual(NSDictionary(dictionary: lhs), NSDictionary(dictionary: rhs))
    }

    func XCTAssertEqualArrays(lhs: [AnyObject], _ rhs: [AnyObject]) {
        XCTAssertEqual(NSArray(array: lhs), NSArray(array: rhs))
    }

    func XCTAssertEqualUnorderedArrays(lhs: [AnyObject], _ rhs: [AnyObject]) {
        let array = NSArray(array: rhs)

        for object in lhs {
            XCTAssert(array.containsObject(object))
        }
    }

    func XCTAssertEqualOptionals<T: Equatable>(lhs: T?, _ rhs: T?) {
        switch (lhs, rhs) {
        case let (.Some(lhs), .Some(rhs)):
            XCTAssertEqual(lhs, rhs)
        case (nil, nil):
            XCTAssertEqual(true, true) // meh
        default:
            XCTFail()
        }
    }
}
