//
// JASON+Operators.swift
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

precedencegroup JASONPrecedence {
    associativity: right
    higherThan: AssignmentPrecedence
}

// MARK: - The <| operator

infix operator <| : JASONPrecedence


/// Assigns the value if it is present and convertible to T
public func <| <T: Any>( lhs: inout T, json: JSON) {
    if let value = json.object as? T {
        lhs = value
    }
}

/// Assigns the value if it is present and convertible to T
public func <| <T: Any>( lhs: inout T?, json: JSON) {
    if let value = json.object as? T {
        lhs = value
    }
}

/// Assigns the value if it is present and convertible to T
public func <| <T: Any>( lhs: inout T!, json: JSON) {
    if let value = json.object as? T {
        lhs = value
    }
}

// MARK: - The <? operator

infix operator <? : JASONPrecedence

/// Assigns the value or nil if not present/convertible to T
public func <? <T: Any>( lhs: inout T?, json: JSON) {
    lhs = json.object as? T
}

/// Assigns the value or nil if not present/convertible to T
public func <? <T: Any>( lhs: inout T!, json: JSON) {
    lhs = json.object as? T
}

// MARK: - The <! operator

infix operator <! : JASONPrecedence

/// Assigns the value or a default value if not present/convertible to T
public func <! <T: Any>( lhs: inout T, json: JSON) {
    if let value = json.object as? T ?? JSON.defaultValue(for: T.self) {
        lhs = value
    }
}

/// Assigns the value or a default value if not present/convertible to T
public func <! <T: Any>( lhs: inout T?, json: JSON) {
    if let value = json.object as? T ?? JSON.defaultValue(for: T.self) {
        lhs = value
    }
}

/// Assigns the value or a default value if not present/convertible to T
public func <! <T: Any>( lhs: inout T!, json: JSON) {
    if let value = json.object as? T ?? JSON.defaultValue(for: T.self) {
        lhs = value
    }
}

// MARK: - Private extensions

private extension JSON {
    /**
     Given a struct or a class of any type, it returns its default value.
     
     - parameter type: A type
     
     - returns: An instance of the given type or nil
     */
    static func defaultValue<T: Any>(for type: T.Type) -> T? {
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
