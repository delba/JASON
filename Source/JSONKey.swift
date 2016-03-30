//
//  JSONKey.swift
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

public class JSONKeys {}

private enum KeyType {
    case String(Swift.String)
    case Int(Swift.Int)
}

public class JSONKey<ValueType>: JSONKeys {
    private let type: KeyType
    
    public init(_ key: String) {
        self.type = .String(key)
    }
    
    public init(_ key: Int) {
        self.type = .Int(key)
    }
}

private extension JSON {
    subscript(type: KeyType) -> JSON {
        switch type {
        case .String(let key): return self[key]
        case .Int(let key): return self[key]
        }
    }
}

extension JSON {
    /// The value as a string or nil if not present/convertible
    public subscript(key: JSONKey<String?>) -> String? {
        return self[key.type].string
    }
    
    /// The value as a string or "" if not present/convertible
    public subscript(key: JSONKey<String>) -> String {
        return self[key.type].stringValue
    }
    
    /// The value as a boolean or nil if not present/convertible
    public subscript(key: JSONKey<Bool?>) -> Bool? {
        return self[key.type].bool
    }
    
    /// The value as a boolean or false if not present/convertible
    public subscript(key: JSONKey<Bool>) -> Bool {
        return self[key.type].boolValue
    }
    
    /// The value as a 64-bit signed integer or nil if not present/convertible
    public subscript(key: JSONKey<Int?>) -> Int? {
        return self[key.type].int
    }
    
    /// The value as a 64-bit signed integer or 0 if not present/convertible
    public subscript(key: JSONKey<Int>) -> Int {
        return self[key.type].intValue
    }
    
    /// The value as a 64-bit floating-point number or nil if not present/convertible
    public subscript(key: JSONKey<Double?>) -> Double? {
        return self[key.type].double
    }
    
    /// The value as a 64-bit floating-point number or 0.0 if not present/convertible
    public subscript(key: JSONKey<Double>) -> Double {
        return self[key.type].doubleValue
    }
    
    /// The value as a 32-bit floating-point number or nil if not present/convertible
    public subscript(key: JSONKey<Float?>) -> Float? {
        return self[key.type].float
    }
    
    /// The value as a 32-bit floating-point number or 0.0 if not present/convertible
    public subscript(key: JSONKey<Float>) -> Float {
        return self[key.type].floatValue
    }
    
    /// The value as JSON
    public subscript(key: JSONKey<JSON>) -> JSON {
        return self[key.type]
    }
}

extension JSON {
    /// The value as an array or nil if not present/convertible
    public subscript(key: JSONKey<[AnyObject]?>) -> [AnyObject]? {
        return self[key.type].array
    }
    
    /// The value as an array or an empty array if not present/convertible
    public subscript(key: JSONKey<[AnyObject]>) -> [AnyObject] {
        return self[key.type].arrayValue
    }
    
    /// The value as an array or nil if not present/convertible
    public subscript(key: JSONKey<[JSON]?>) -> [JSON]? {
        return self[key.type].jsonArray
    }
    
    /// The value as an array or an empty array if not present/convertible
    public subscript(key: JSONKey<[JSON]>) -> [JSON] {
        return self[key.type].jsonArrayValue
    }
}

extension JSON {
    /// The value as a dictionary or nil if not present/convertible
    public subscript(key: JSONKey<[String: AnyObject]?>) -> [String: AnyObject]? {
        return self[key.type].dictionary
    }
    
    /// The value as a dictionary or an empty dictionary if not present/convertible
    public subscript(key: JSONKey<[String: AnyObject]>) -> [String: AnyObject] {
        return self[key.type].dictionaryValue
    }
    
    /// The value as a dictionary or nil if not present/convertible
    public subscript(key: JSONKey<[String: JSON]?>) -> [String: JSON]? {
        return self[key.type].jsonDictionary
    }
    
    /// The value as a dictionary or an empty dictionary if not present/convertible
    public subscript(key: JSONKey<[String: JSON]>) -> [String: JSON] {
        return self[key.type].jsonDictionaryValue
    }
}
