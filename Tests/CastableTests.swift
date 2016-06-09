//
// GenericsTests.swift
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

let json: JSON = {
    guard let path = NSBundle(forClass: JSONTests.self).pathForResource("shots", ofType: "json") else {
        fatalError()
    }
    
    let data = try? NSData(contentsOfFile: path, options: [])
    
    return JSON(data)
}()

class CastableTests: XCTestCase {
    func testString() {
        let shot = json[0]
        
        var maybe: String?
        maybe = shot.get("title")
        XCTAssertEqual("Create New Project", maybe)
        maybe = json.get("nope")
        XCTAssertNil(maybe)
        
        var value: String
        value = shot.get("title")
        XCTAssertEqual("Create New Project", value)
        value = json.get("nope")
        XCTAssertEqual("", value)
    }
    
    func testInt() {
        let shot = json[0]
        
        var maybe: Int?
        maybe = shot.get("id")
        XCTAssertEqual(2623488, maybe)
        maybe = json.get("nope")
        XCTAssertNil(maybe)
        
        var value: Int
        value = shot.get("id")
        XCTAssertEqual(2623488, value)
        value = json.get("nope")
        XCTAssertEqual(0, value)
    }
    
    func testDouble() {
        let shot = json[0]
        
        var maybe: Double?
        maybe = shot.get("width")
        XCTAssertEqual(400.0, maybe)
        maybe = json.get("nope")
        XCTAssertNil(maybe)
        
        var value: Double
        value = shot.get("width")
        XCTAssertEqual(400.0, value)
        value = json.get("nope")
        XCTAssertEqual(0.0, value)
    }
    
    func testFloat() {
        let shot = json[0]
        
        var maybe: Float?
        maybe = shot.get("width")
        XCTAssertEqual(Float(400), maybe)
        maybe = json.get("nope")
        XCTAssertNil(maybe)
        
        var value: Float
        value = shot.get("width")
        XCTAssertEqual(Float(400), value)
        value = json.get("nope")
        XCTAssertEqual(Float(0), value)
    }
    
    func testBool() {
        let shot = json[0]
        
        var maybe: Bool?
        maybe = shot.get("animated")
        XCTAssertEqual(true, maybe)
        maybe = json.get("nope")
        XCTAssertNil(maybe)
        
        var value: Bool
        value = shot.get("animated")
        XCTAssertEqual(true, value)
        value = json.get("nope")
        XCTAssertEqual(false, value)
    }
    
    func testArray() {
        let shot = json[0]
        
        let tags = [
          "board",
          "collaboration",
          "create",
          "design",
          "desktop",
          "invision",
          "mobile",
          "new project",
          "prototype",
          "workflow"
        ]
        
        var maybe: [String]?
        maybe = shot.get("tags")
        XCTAssertEqual(tags, maybe!)
        maybe = json.get("nope")
        XCTAssertNil(maybe)
        
        var value: [String]
        value = shot.get("tags")
        XCTAssertEqual(tags, value)
        value = json.get("nope")
        XCTAssertEqual([], value)
    }
    
    func testDictionary() {
        let shot = json[0]
        
        let images = [
          "hidpi": "https://d13yacurqjgara.cloudfront.net/users/136707/screenshots/2623488/create_new_project.gif",
          "normal": "https://d13yacurqjgara.cloudfront.net/users/136707/screenshots/2623488/create_new_project_1x.gif",
          "teaser": "https://d13yacurqjgara.cloudfront.net/users/136707/screenshots/2623488/create_new_project_teaser.gif"
        ]
        
        var maybe: [String: String]?
        maybe = shot.get("images")
        XCTAssertEqual(images, maybe!)
        maybe = json.get("nope")
        XCTAssertNil(maybe)
        
        var value: [String: String]
        value = shot.get("images")
        XCTAssertEqual(images, value)
        value = json.get("nope")
        XCTAssertEqual([:], value)
    }
}
