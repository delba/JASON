//
// Utilities.swift
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

internal extension XCTestCase {
    func AssertEqualDictionaries(_ lhs: [String: Any], _ rhs: [String: Any]) {
        XCTAssertEqual(NSDictionary(dictionary: lhs), NSDictionary(dictionary: rhs))
    }

    func AssertEqualArrays(_ lhs: [Any], _ rhs: [Any]) {
        XCTAssertEqual(NSArray(array: lhs), NSArray(array: rhs))
    }

    func AssertEqualUnorderedArrays(_ lhs: [Any], _ rhs: [Any]) {
        let array = NSArray(array: rhs)

        for object in lhs {
            XCTAssert(array.contains(object))
        }
    }

    func AssertEqualOptionals<T: Equatable>(_ lhs: T?, _ rhs: T?) {
        switch (lhs, rhs) {
        case let (.some(lhs), .some(rhs)):
            XCTAssertEqual(lhs, rhs)
        case (nil, nil):
            XCTAssertEqual(true, true) // meh
        default:
            XCTFail()
        }
    }
}
