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
    /**
     Returns the value associated with the given key as a 8-bit signed integer or nil if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 8-bit signed integer or nil if not present/convertible.
     */
    public subscript(key: JSONKey<Int8?>) -> Int8? {
        return self[key.type].int8
    }
    
    /**
     Returns the value associated with the given key as a 8-bit signed integer or 0 if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 8-bit signed integer or 0 if not present/convertible.
     */
    public subscript(key: JSONKey<Int8>) -> Int8 {
        return self[key.type].int8Value
    }
    
    /**
     Returns the value associated with the given key as a 16-bit signed integer or nil if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 16-bit signed integer or nil if not present/convertible.
     */
    public subscript(key: JSONKey<Int16?>) -> Int16? {
        return self[key.type].int16
    }
    
    /**
     Returns the value associated with the given key as a 16-bit signed integer or 0 if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 16-bit signed integer or 0 if not present/convertible.
     */
    public subscript(key: JSONKey<Int16>) -> Int16 {
        return self[key.type].int16Value
    }
    
    /**
     Returns the value associated with the given key as a 32-bit signed integer or nil if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 32-bit signed integer or nil if not present/convertible.
     */
    public subscript(key: JSONKey<Int32?>) -> Int32? {
        return self[key.type].int32
    }
    
    /**
     Returns the value associated with the given key as a 32-bit signed integer or 0 if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 32-bit signed integer or 0 if not present/convertible.
     */
    public subscript(key: JSONKey<Int32>) -> Int32 {
        return self[key.type].int32Value
    }
    
    /**
     Returns the value associated with the given key as a 64-bit signed integer or nil if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 64-bit signed integer or nil if not present/convertible.
     */
    public subscript(key: JSONKey<Int64?>) -> Int64? {
        return self[key.type].int64
    }
    
    /**
     Returns the value associated with the given key as a 64-bit signed integer or 0 if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 64-bit signed integer or 0 if not present/convertible.
     */
    public subscript(key: JSONKey<Int64>) -> Int64 {
        return self[key.type].int64Value
    }
}

// MARK: - Unsigned Integers

extension JSON {
    /**
     Returns the value associated with the given key as a 64-bit unsigned integer or nil if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 64-bit unsigned integer or nil if not present/convertible.
     */
    public subscript(key: JSONKey<UInt?>) -> UInt? {
        return self[key.type].uInt
    }
    
    /**
     Returns the value associated with the given key as a 64-bit unsigned integer or 0 if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 64-bit unsigned integer or 0 if not present/convertible.
     */
    public subscript(key: JSONKey<UInt>) -> UInt {
        return self[key.type].uIntValue
    }
    
    /**
     Returns the value associated with the given key as a 8-bit unsigned integer or nil if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 8-bit unsigned integer or nil if not present/convertible.
     */
    public subscript(key: JSONKey<UInt8?>) -> UInt8? {
        return self[key.type].uInt8
    }
    
    /**
     Returns the value associated with the given key as a 8-bit unsigned integer or 0 if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 8-bit unsigned integer or 0 if not present/convertible.
     */
    public subscript(key: JSONKey<UInt8>) -> UInt8 {
        return self[key.type].uInt8Value
    }
    
    /**
     Returns the value associated with the given key as a 16-bit unsigned integer or nil if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 16-bit unsigned integer or nil if not present/convertible.
     */
    public subscript(key: JSONKey<UInt16?>) -> UInt16? {
        return self[key.type].uInt16
    }
    
    /**
     Returns the value associated with the given key as a 16-bit unsigned integer or 0 if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 16-bit unsigned integer or 0 if not present/convertible.
     */
    public subscript(key: JSONKey<UInt16>) -> UInt16 {
        return self[key.type].uInt16Value
    }
    
    /**
     Returns the value associated with the given key as a 32-bit unsigned integer or nil if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 32-bit unsigned integer or nil if not present/convertible.
     */
    public subscript(key: JSONKey<UInt32?>) -> UInt32? {
        return self[key.type].uInt32
    }
    
    /**
     Returns the value associated with the given key as a 32-bit unsigned integer or 0 if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 32-bit unsigned integer or 0 if not present/convertible.
     */
    public subscript(key: JSONKey<UInt32>) -> UInt32 {
        return self[key.type].uInt32Value
    }
    
    /**
     Returns the value associated with the given key as a 64-bit unsigned integer or nil if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 64-bit unsigned integer or nil if not present/convertible.
     */
    public subscript(key: JSONKey<UInt64?>) -> UInt64? {
        return self[key.type].uInt64
    }
    
    /**
     Returns the value associated with the given key as a 64-bit unsigned integer or 0 if not present/convertible.
     
     - parameter key: The key.
     
     - returns: The value associated with the given key as a 64-bit unsigned integer or 0 if not present/convertible.
     */
    public subscript(key: JSONKey<UInt64>) -> UInt64 {
        return self[key.type].uInt64Value
    }
}