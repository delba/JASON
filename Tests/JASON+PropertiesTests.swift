//
//  JASON+PropertiesTests.swift
//  JASON
//
//  Created by Dagan Packman on 4/30/16.
//  Copyright © 2016 Damien. All rights reserved.
//

import XCTest
import JASON

class JASON_PropertiesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNumberProperties() {

        var integer: Int
        var json: JSON

        integer = 0
        json = JSON(integer)
        XCTAssert(json.int == integer)
        XCTAssert(json.int8 == Int8(integer))
        XCTAssert(json.int16 == Int16(integer))
        XCTAssert(json.int32 == Int32(integer))
        XCTAssert(json.int64 == Int64(integer))
        XCTAssert(json.uInt == UInt(integer))
        XCTAssert(json.uInt8 == UInt8(integer))
        XCTAssert(json.uInt16 == UInt16(integer))
        XCTAssert(json.uInt32 == UInt32(integer))
        XCTAssert(json.uInt64 == UInt64(integer))

        integer = Int(Int8.max)
        json = JSON(integer)
        XCTAssert(json.int == integer)
        XCTAssert(json.int8 == Int8(integer))
        XCTAssert(json.int16 == Int16(integer))
        XCTAssert(json.int32 == Int32(integer))
        XCTAssert(json.int64 == Int64(integer))
        XCTAssert(json.uInt == UInt(integer))
        XCTAssert(json.uInt8 == UInt8(integer))
        XCTAssert(json.uInt16 == UInt16(integer))
        XCTAssert(json.uInt32 == UInt32(integer))
        XCTAssert(json.uInt64 == UInt64(integer))

        integer = Int(Int8.min)
        json = JSON(integer)
        XCTAssert(json.int == integer)
        XCTAssert(json.int8 == Int8(integer))
        XCTAssert(json.int16 == Int16(integer))
        XCTAssert(json.int32 == Int32(integer))
        XCTAssert(json.int64 == Int64(integer))
        XCTAssertNil(json.uInt)
        XCTAssertNil(json.uInt8)
        XCTAssertNil(json.uInt16)
        XCTAssertNil(json.uInt32)
        XCTAssertNil(json.uInt64)

        integer = Int(Int16.max)
        json = JSON(integer)
        XCTAssert(json.int == integer)
        XCTAssertNil(json.int8)
        XCTAssert(json.int16 == Int16(integer))
        XCTAssert(json.int32 == Int32(integer))
        XCTAssert(json.int64 == Int64(integer))
        XCTAssert(json.uInt == UInt(integer))
        XCTAssertNil(json.uInt8)
        XCTAssert(json.uInt16 == UInt16(integer))
        XCTAssert(json.uInt32 == UInt32(integer))
        XCTAssert(json.uInt64 == UInt64(integer))

        integer = Int(Int16.min)
        json = JSON(integer)
        XCTAssert(json.int == integer)
        XCTAssertNil(json.int8)
        XCTAssert(json.int16 == Int16(integer))
        XCTAssert(json.int32 == Int32(integer))
        XCTAssert(json.int64 == Int64(integer))
        XCTAssertNil(json.uInt)
        XCTAssertNil(json.uInt8)
        XCTAssertNil(json.uInt16)
        XCTAssertNil(json.uInt32)
        XCTAssertNil(json.uInt64)

        integer = Int(Int32.max)
        json = JSON(integer)
        XCTAssert(json.int == integer)
        XCTAssertNil(json.int8)
        XCTAssertNil(json.int16)
        XCTAssert(json.int32 == Int32(integer))
        XCTAssert(json.int64 == Int64(integer))
        XCTAssert(json.uInt == UInt(integer))
        XCTAssertNil(json.uInt8)
        XCTAssertNil(json.uInt16)
        XCTAssert(json.uInt32 == UInt32(integer))
        XCTAssert(json.uInt64 == UInt64(integer))

        integer = Int(Int32.min)
        json = JSON(integer)
        XCTAssert(json.int == integer)
        XCTAssertNil(json.int8)
        XCTAssertNil(json.int16)
        XCTAssert(json.int32 == Int32(integer))
        XCTAssert(json.int64 == Int64(integer))
        XCTAssertNil(json.uInt)
        XCTAssertNil(json.uInt8)
        XCTAssertNil(json.uInt16)
        XCTAssertNil(json.uInt32)
        XCTAssertNil(json.uInt64)

        let arch32: Bool = sizeof(Int) < sizeof(Int64)

        integer = Int.max
        json = JSON(integer)
        XCTAssert(json.int == integer)
        XCTAssertNil(json.int8)
        XCTAssertNil(json.int16)
        XCTAssert((arch32 && json.int32 == Int32(integer)) || json.int32 == nil) // 64-bit arch Int32(Int.max) overflows
        XCTAssert(json.int64 == Int64(integer))
        XCTAssert(json.uInt == UInt(integer))
        XCTAssertNil(json.uInt8)
        XCTAssertNil(json.uInt16)
        XCTAssert((arch32 && json.uInt32 == UInt32(integer)) || json.uInt32 == nil) // 64-bit arch UInt32(Int.max) overflows
        XCTAssert(json.uInt64 == UInt64(integer))

        integer = Int.min
        json = JSON(integer)
        XCTAssert(json.int == integer)
        XCTAssertNil(json.int8)
        XCTAssertNil(json.int16)
        XCTAssert((arch32 && json.int32 == Int32(integer)) || json.int32 == nil) // 64-bit arch Int32(Int.min) underflows
        XCTAssert(json.int64 == Int64(integer))
        XCTAssertNil(json.uInt)
        XCTAssertNil(json.uInt8)
        XCTAssertNil(json.uInt16)
        XCTAssertNil(json.uInt32)
        XCTAssertNil(json.uInt64)

    }
}
