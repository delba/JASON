//
// LiteralConvertibleTests.swift
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

class LiteralConvertibleTests: XCTestCase {
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