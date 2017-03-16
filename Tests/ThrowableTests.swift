//
//  ThrowableTests.swift
//  JASON
//
//  Created by Damien on 27/01/2017.
//  Copyright © 2017 Damien. All rights reserved.
//

import XCTest
import JASON

fileprivate extension Keys {
    static let string                 = Key<String>("string")
    static let optionalString         = Key<String>("optional_string")
    static let int                    = Key<Int>("int")
    static let optionalInt            = Key<Int>("optional_int")
    static let double                 = Key<Double>("double")
    static let optionalDouble         = Key<Double>("optional_double")
    static let float                  = Key<Float>("float")
    static let optionalFloat          = Key<Float>("optional_float")
    static let cgFloat                = Key<CGFloat>("float")
    static let optionalCGFloat        = Key<CGFloat>("float")
    static let nsNumber               = Key<NSNumber>("float")
    static let optionalNSNumber       = Key<NSNumber>("optional_float")
    static let bool                   = Key<Bool>("bool")
    static let optionalBool           = Key<Bool>("optional_bool")
    static let array                  = Key<[Any]>("array")
    static let optionalArray          = Key<[Any]>("optional_array")
    static let dictionary             = Key<[String: Any]>("dictionary")
    static let optionalDictionary     = Key<[String: Any]>("optional_dictionary")
    static let arrayJSON              = Key<[JSON]>("arrayJSON")
    static let optionalArrayJSON      = Key<[JSON]>("optional_arrayJSON")
    static let dictionaryJSON         = Key<[String: JSON]>("dictionaryJSON")
    static let optionalDictionaryJSON = Key<[String: JSON]>("optional_dictionaryJSON")
    static let json                   = Key<JSON>("json")
    static let date                   = Key<Date>("date")
    static let wrong                  = Key<String>("wrong")
}

fileprivate struct Object {
    let string: String
    var optionalString: String?
    let int: Int
    var optionalInt: Int?
    let double: Double
    var optionalDouble: Double?
    let float: Float
    var optionalFloat: Float?
    let nsNumber: NSNumber
    var optionalNSNumber: NSNumber?
    let bool: Bool
    var optionalBool: Bool?
    let array: [Any]
    var optionalArray: [Any]?
    let dictionary: [String: Any]
    let optionalDictionary: [String: Any]?
    let json: JSON
    let date: Date
    // let cgFloat: CGFloat
    // var optionalCGFloat: CGFloat?
    // let arrayJSON: [JSON]
    // var optionalArrayJSON: [JSON]?
    // let dictionaryJSON: [String: JSON]
    // var optionalDictionaryJSON: [String: JSON]?
    // let wrong: String?

    init(json: JSON) throws {
        JSON.dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        self.string                 = try  json.get(.string)
        self.optionalString         = try? json.get(.optionalString)
        self.int                    = try  json.get(.int)
        self.optionalInt            = try? json.get(.optionalInt)
        self.double                 = try  json.get(.double)
        self.optionalDouble         = try? json.get(.optionalDouble)
        self.nsNumber               = try  json.get(.nsNumber)
        self.optionalNSNumber       = try? json.get(.optionalNSNumber)
        self.bool                   = try  json.get(.bool)
        self.optionalBool           = try? json.get(.optionalBool)
        self.float                  = try  json.get(.float)
        self.optionalFloat          = try? json.get(.optionalFloat)
        self.array                  = try  json.get(.array)
        self.optionalArray          = try? json.get(.optionalArray)
        self.dictionary             = try  json.get(.dictionary)
        self.optionalDictionary     = try? json.get(.optionalDictionary)
        self.json                   = try  json.get(.json)
        self.date                   = try  json.get(.date)

        // self.cgFloat                = try json.get(.cgFloat)
        // self.optionalCGFloat        = try json.get(.optionalCGFloat)
        // self.arrayJSON              = try json.get(.arrayJSON)
        // self.optionalArrayJSON      = try json.get(.optionalArrayJSON)
        // self.dictionaryJSON         = try json.get(.dictionaryJSON)
        // self.optionalDictionaryJSON = try json.get(.optionalDictionaryJSON)
        // self.wrong                  = try json.get(.wrong)
    }
}

class ThrowableTests: XCTestCase {
    let json: JSON = [
        "string": "string",
        "optional_string": "string",
        "int": 42,
        "optional_int": 42,
        "double": 4.2,
        "optional_double": 4.2,
        "float": CGFloat(4.2),
        "optional_float": 4.2,
        "bool": true,
        "optional_bool": true,
        "array": ["string", 42, 4.2, true],
        "optional_array": ["string", 42, 4.2, true],
        "dictionary": ["string": 42],
        "optional_dictionary": ["string": 42],
        "date": "2016-04-12T13:29:32",
        "json": ["name": "Ale", "age": 25]
    ]

    func testThrowable() {
        do {
            let object = try Object(json: json)
            XCTAssertEqual("string", object.string)
            XCTAssertEqual("string", object.optionalString)
            XCTAssertEqual(42, object.int)
            XCTAssertEqual(42, object.optionalInt)
            XCTAssertEqual(4.2, object.double)
            XCTAssertEqual(4.2, object.optionalDouble)
            XCTAssertEqual(4.2, object.float)
            XCTAssertEqual(4.2, object.optionalFloat)
            XCTAssertEqual(NSNumber(value: 4.2), object.optionalNSNumber)
            XCTAssertEqual(NSNumber(value: 4.2), object.nsNumber)
            XCTAssertEqual(true, object.bool)
            XCTAssertEqual(true, object.optionalBool)
            AssertEqualArrays(["string", 42, 4.2, true], object.array)
            AssertEqualArrays(["string", 42, 4.2, true], object.optionalArray!)
            AssertEqualDictionaries(["string": 42], object.dictionary)
            AssertEqualDictionaries(["string": 42], object.optionalDictionary!)
            print(object)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
