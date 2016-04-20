//
// OperatorsTests.swift
//
// Copyright (c) 2015-2016 Damien (http://delba.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import XCTest
import JASON

class OperatorsTests: XCTestCase {
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
}