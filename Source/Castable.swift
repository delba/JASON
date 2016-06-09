//
// Generics.swift
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

public protocol Castable {
    static func defaultValue() -> Self
    static func maybe(object: AnyObject?) -> Self?
    static func value(object: AnyObject?) -> Self
}

public extension Castable {
    static func maybe(object: AnyObject?) -> Self? {
        return object as? Self
    }
    
    static func value(object: AnyObject?) -> Self {
        return maybe(object) ?? defaultValue()
    }
}

extension String: Castable {
    public static func defaultValue() -> String { return "" }
}

extension Int: Castable {
    public static func defaultValue() -> Int { return 0 }
}

extension Double: Castable {
    public static func defaultValue() -> Double { return 0 }
}

extension Float: Castable {
    public static func defaultValue() -> Float { return 0 }
}

extension Bool: Castable {
    public static func defaultValue() -> Bool { return false }
}

extension Dictionary: Castable {
    public static func defaultValue() -> Dictionary { return [:] }
}

extension Array: Castable {
    public static func defaultValue() -> Array { return [] }
}


extension JSON {
    public func get<T: Castable>(key: String) -> T {
        return T.value(self[key].object)
    }
    
    public func get<T: Castable>(key: String) -> T? {
        return T.maybe(self[key].object)
    }
    
    public func get<T: Castable>(key: Int) -> T {
        return T.value(self[key].object)
    }
    
    public func get<T: Castable>(key: Int) -> T? {
        return T.maybe(self[key].object)
    }
    
    public func get<T: Castable>(path indexes: Any...) -> T {
        return T.value(self[indexes].object)
    }
    
    public func get<T: Castable>(path indexes: Any...) -> T? {
        return T.maybe(self[indexes].object)
    }
}