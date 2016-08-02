//
// JSONTests.swift
//
// Copyright (c) 2016 Damien (http://delba.io)
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

class JSONTests: XCTestCase {
    func testInitWithObject() {
        let object: AnyObject = ["name": "Brandon Walsh"]
        let json = JSON(object)
        AssertEqualDictionaries(object as! [String: AnyObject], json.dictionaryValue)
    }

    func testInitWithData() {
        if let path = Bundle(for: JSONTests.self).path(forResource: "shots", ofType: "json") {
            let data: Data?
            do {
                data = try Data(contentsOf: URL(fileURLWithPath: path), options: [])
            } catch _ {
                data = nil
            }
            let json = JSON(data)
            XCTAssertEqual("Create New Project", json[0]["title"].stringValue)
        } else {
            XCTFail("JASON.json doesn't exist.")
        }
    }
    
    func testSubscriptWithString() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "age": 17
        ]

        _ = json[42]
    }

    func testSubscriptWithInt() {

    }

    func testPath() {
        let json: JSON = [
            "user": [
                "name": "Jason",
                "nicknames": [
                    "J"
                ]
            ]
        ]
        
        XCTAssertEqual("Jason", json[path: "user", "name"].stringValue)
        XCTAssertEqual("J", json[path: "user", "nicknames", 0].stringValue)
    }
}
