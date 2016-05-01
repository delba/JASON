//
// JASON+Properties.swift
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

import JASON

// MARK: - Signed Integers

extension JSON {
    // The value as a 8-bit signed integer or nil if not present/convertible
    public var int8: Int8? { return int != nil && intValue >= Int(Int8.min) && intValue <= Int(Int8.max) ? Int8(intValue) : nil }
    // The value as a 8-bit signed integer or 0 if not present/convertible
    public var int8Value: Int8 { return int8 ?? 0 }
    
    // The value as a 16-bit signed integer or nil if not present/convertible
    public var int16: Int16? { return int != nil && intValue >= Int(Int16.min) && intValue <= Int(Int16.max) ? Int16(intValue) : nil }
    // The value as a 16-bit signed integer or 0 if not present/convertible
    public var int16Value: Int16 { return int16 ?? 0 }
    
    // The value as a 32-bit signed integer or nil if not present/convertible
    public var int32: Int32? { return int != nil && intValue >= Int(Int32.min) && intValue <= Int(Int32.max) ? Int32(intValue) : nil }
    // The value as a 64-bit signed integer or 0 if not present/convertible
    public var int32Value: Int32 { return int32 ?? 0 }
    
    // The value as a 64-bit signed integer or nil if not present/convertible
    public var int64: Int64? { return int != nil ? Int64(intValue) : nil }
    // The value as a 64-bit signed integer or 0 if not present/convertible
    public var int64Value: Int64 { return int64 ?? 0 }
}

// MARK: - Unsigned Integers

extension JSON {
    // The value as a 64-bit unsigned integer or nil if not present/convertible
    public var uInt: UInt? { return int != nil && intValue >= 0 ? UInt(intValue) : nil }
    // The value as a 64-bit unsigned integer or 0 if not present/convertible
    public var uIntValue: UInt { return uInt ?? 0 }
    
    // The value as a 8-bit signed integer or nil if not present/convertible
    public var uInt8: UInt8? { return int != nil && intValue >= 0 && intValue <= Int(UInt8.max) ? UInt8(intValue) : nil }
    // The value as a 8-bit signed integer or 0 if not present/convertible
    public var uInt8Value: UInt8 { return uInt8 ?? 0 }
    
    // The value as a 16-bit signed integer or nil if not present/convertible
    public var uInt16: UInt16? { return int != nil && intValue >= 0 && intValue <= Int(UInt16.max) ? UInt16(intValue) : nil }
    // The value as a 16-bit signed integer or 0 if not present/convertible
    public var uInt16Value: UInt16 { return uInt16 ?? 0 }
    
    // The value as a 32-bit signed integer or nil if not present/convertible
    public var uInt32: UInt32? { return int != nil && intValue >= 0 && Int64(intValue) <= Int64(UInt32.max) ? UInt32(intValue) : nil }
    // The value as a 32-bit signed integer or 0 if not present/convertible
    public var uInt32Value: UInt32 { return uInt32 ?? 0 }
    
    // The value as a 64-bit signed integer or nil if not present/convertible
    public var uInt64: UInt64? { return int != nil && intValue >= 0 ? UInt64(intValue) : nil }
    // The value as a 64-bit signed integer or 0 if not present/convertible
    public var uInt64Value: UInt64 { return uInt64 ?? 0 }
}
