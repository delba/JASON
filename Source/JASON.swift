//
//  JASON
//
// The MIT License (MIT)
// 
// Copyright (c) 2015 Damien D.
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

import Foundation

// MARK: Initializers

public struct JSON {
    /// The object on which any subsequent method operates
    public let object: AnyObject?
    
    /**
        Creates an instance of JSON from AnyObject.
    
        - parameter object: An instance of any class
    
        - returns: the created JSON
    */
    public init(_ object: AnyObject?) {
        self.init(object: object)
    }
    
    /**
        Creates an instance of JSON from NSData.
    
        - parameter data: An instance of NSData
    
        - returns: the created JSON
    */
    public init(_ data: NSData?) {
        self.init(object: JSON.objectWithData(data))
    }
    
    /**
        Creates an instance of JSON from AnyObject.
        Takes an explicit parameter name to prevent calls to init(_:) with NSData? when nil is passed.
    
        - parameter object: An instance of any class
    
        - returns: the created JSON
    */
    private init(object: AnyObject?) {
        self.object = object
    }
}

// MARK: Subscript

extension JSON {
    /**
        Creates a new instance of JSON.
    
        - parameter index: A string
    
        - returns: a new instance of JSON or itself is object is nil.
    */
    public subscript(index: String) -> JSON {
        if object == nil { return self }
        
        if let nsDictionary = nsDictionary {
            return JSON(nsDictionary[index])
        }
        
        return JSON(object: nil)
    }
    
    /**
        Creates a new instance of JSON.
    
        - parameter index: A string
    
        - returns: a new instance of JSON or itself is object is nil.
    */
    public subscript(index: Int) -> JSON {
        if object == nil { return self }
        
        if let nsArray = nsArray {
            return JSON(nsArray[safe: index])
        }
        
        return JSON(object: nil)
    }
}

// MARK: String

extension JSON {
    /// The value as a string or nil if not present/convertible
    public var string: String? { return object as? String }
    /// The value as a string or "" if not present/convertible
    public var stringValue: String { return string ?? "" }
}

// MARK: Integer

extension JSON {
    /// The value as a 64-bit signed integer or nil if not present/convertible
    public var int: Int? { return object as? Int }
    /// The value as a 64-bit signed integer or 0 if not present/convertible
    public var intValue: Int { return int ?? 0 }
}

// MARK: FloatingPointType

extension JSON {
    /// The value as a 64-bit floating-point number or nil if not present/convertible
    public var double: Double? { return object as? Double }
    /// The value as a 64-bit floating-point number or 0.0 if not present/convertible
    public var doubleValue: Double { return double ?? 0 }
    
    /// The value as a 32-bit floating-point number or nil if not present/convertible
    public var float: Float? { return object as? Float }
    /// The value as a 32-bit floating-point number or 0.0 if not present/convertible
    public var floatValue: Float { return float ?? 0 }
}

// MARK: Bool

extension JSON {
    /// The value as a boolean or nil if not present/convertible
    public var bool: Bool? { return object as? Bool }
    /// The value as a boolean or false if not present/convertible
    public var boolValue: Bool { return bool ?? false }
}

// MARK: Dictionary

extension JSON {
    /// The value as a dictionary or nil if not present/convertible
    public var dictionary: [String: AnyObject]? { return object as? [String: AnyObject] }
    /// The value as a dictionary or an empty dictionary if not present/convertible
    public var dictionaryValue: [String: AnyObject] { return dictionary ?? [:] }
}

// MARK: Array

extension JSON {
    /// The value as an array or nil if not present/convertible
    public var array: [AnyObject]? { return object as? [AnyObject] }
    /// The value as an array or an empty array if not present/convertible
    public var arrayValue: [AnyObject] { return array ?? [] }
}

// MARK: NSDictionary

private extension JSON {
    /// The value as a dictionary (NSDictionary) or nil if not present/convertible
    var nsDictionary: NSDictionary? { return object as? NSDictionary }
}

// MARK: NSArray

private extension JSON {
    /// The value as an array (NSArray) or nil if not present/convertible
    var nsArray: NSArray? { return object as? NSArray }
}

// MARK: Operators

infix operator <| {
    associativity right
    precedence 90
}

/// Assigns the value if it is present and convertible to T
public func <| <T: Any>(inout lhs: T, json: JSON) {
    if let value = json.object as? T {
        lhs = value
    }
}

/// Assigns the value if it is present and convertible to T
public func <| <T: Any>(inout lhs: T?, json: JSON) {
    if let value = json.object as? T {
        lhs = value
    }
}

/// Assigns the value if it is present and convertible to T
public func <| <T: Any>(inout lhs: T!, json: JSON) {
    if let value = json.object as? T {
        lhs = value
    }
}

infix operator <? {
    associativity right
    precedence 90
}

/// Assigns the value or nil if not present/convertible to T
public func <? <T: Any>(inout lhs: T?, json: JSON) {
    lhs = json.object as? T
}

/// Assigns the value or nil if not present/convertible to T
public func <? <T: Any>(inout lhs: T!, json: JSON) {
    lhs = json.object as? T
}

infix operator <! {
    associativity right
    precedence 90
}

/// Assigns the value or a default value if not present/convertible to T
public func <! <T: Any>(inout lhs: T, json: JSON) {
    if let value = json.object as? T ?? JSON.defaultValueFor(T.self) {
        lhs = value
    }
}

/// Assigns the value or a default value if not present/convertible to T
public func <! <T: Any>(inout lhs: T?, json: JSON) {
    if let value = json.object as? T ?? JSON.defaultValueFor(T.self) {
        lhs = value
    }
}

/// Assigns the value or a default value if not present/convertible to T
public func <! <T: Any>(inout lhs: T!, json: JSON) {
    if let value = json.object as? T ?? JSON.defaultValueFor(T.self) {
        lhs = value
    }
}

// MARK: SequenceType

/// Conforming types gain access to reduce, map, filter et al.
extension JSON: SequenceType {
    /**
        The required method to conform to the SequenceType protocol.
    
        - returns: a generator over the elements of arrayValue converted to JSON
    */
    public func generate() -> IndexingGenerator<[JSON]> {
        if let nsArray = nsArray {
            return nsArray.map({ JSON($0) }).generate()
        }
        
        return [JSON]().generate()
    }
}

// MARK: LiteralConvertible

/// Conforming types can be initialized with arbitrary string literals.
extension JSON: StringLiteralConvertible {
    /**
        Creates an instance of JSON from a string literal
    
        - parameter stringLiteral: A string literal
    
        - returns: An instance of JSON
    */
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
    
    /**
        Creates an instance of JSON from a string literal
    
        - parameter extendedGraphemeClusterLiteral: A string literal
    
        - returns: An instance of JSON
    */
    public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        self.init(value)
    }
    
    /**
        Creates an instance of JSON from a string literal
    
        - parameter unicodeScalarLiteral: A string literal
    
        - returns: An instance of JSON
    */
    public init(unicodeScalarLiteral value: StringLiteralType) {
        self.init(value)
    }
}

/// Conforming types can be initialized with integer literals.
extension JSON: IntegerLiteralConvertible {
    /**
        Creates an instance of JSON from an integer literal.
    
        - parameter integerLiteral: An integer literal
    
        - returns: An instance of JSON
    */
    public init(integerLiteral value: IntegerLiteralType) {
        self.init(value)
    }
}

/// Conforming types can be initialized with float literals.
extension JSON: FloatLiteralConvertible {
    /**
        Creates an instance of JSON from a float literal.
    
        - parameter floatLiteral: A float literal
    
        - returns: An instance of JSON
    */
    public init(floatLiteral value: FloatLiteralType) {
        self.init(value)
    }
}

/// Conforming types can be initialized with the Boolean literals true and false.
extension JSON: BooleanLiteralConvertible {
    /**
        Creates an instance of JSON from a boolean literal.
    
        - parameter booleanLiteral: A boolean literal
    
        - returns: An instance of JSON
    */
    public init(booleanLiteral value: BooleanLiteralType) {
        self.init(value)
    }
}

/// Conforming types can be initialized with dictionary literals.
extension JSON: DictionaryLiteralConvertible {
    /**
        Creates an instance of JSON from a dictionary literal.
    
        - parameter dictionaryLiteral: A dictionary literal
        
        - returns: An instance of JSON
    */
    public init(dictionaryLiteral elements: (String, AnyObject)...) {
        var dictionary = [String: AnyObject]()
        
        for (key, value) in elements {
            dictionary[key] = value
        }
        
        self.init(dictionary)
    }
}

/// Conforming types can be initialized with array literals.
extension JSON: ArrayLiteralConvertible {
    /**
        Creates an instance of JSON from an array literal.
    
        - parameter arrayLiteral: An array literal
        
        - returns: An instance of JSON
    */
    public init(arrayLiteral elements: AnyObject...) {
        self.init(elements)
    }
}

/// Conforming types can be initialized with nil.
extension JSON: NilLiteralConvertible {
    /**
        Creates an instance of JSON from a nil literal.
    
        - parameter nilLiteral: A nil literal
    
        - returns: An instance of JSON
    */
    public init(nilLiteral: ()) {
        self.init(object: nil)
    }
}

// MARK: Private extensions

private extension JSON {
    /**
        Converts an instance of NSData to AnyObject.
    
        - parameter data: An instance of NSData or nil
    
        - returns: An instance of AnyObject or nil
    */
    static func objectWithData(data: NSData?) -> AnyObject? {
        if let data = data {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: [])
            } catch _ {
                return nil
            }
        }
        
        return nil
    }
    
    /**
        Given a struct or a class of any type, it returns its default value.
    
        - parameter type: A type
        
        - returns: An instance of the given type or nil
    */
    static func defaultValueFor<T: Any>(type: T.Type) -> T? {
        switch type {
        case is String.Type:
            return "" as? T
        case is Int.Type:
            return 0 as? T
        case is Double.Type:
            return 0.0 as? T
        case is Float.Type:
            return Float(0) as? T
        case is Bool.Type:
            return false as? T
        case is [String: AnyObject].Type:
            return [:] as? T
        case is [AnyObject].Type:
            return [] as? T
        default:
            return nil
        }
    }
}

private extension NSArray {
    /**
        Returns the element at the given index or nil if the index is out of bounds.
        
        - parameter index: An integer
    
        - returns: The element at the given index or nil
    */
    subscript(safe index: Int) -> AnyObject? {
        guard index >= 0 && index < count else { return nil }
        
        return self[index]
    }
}