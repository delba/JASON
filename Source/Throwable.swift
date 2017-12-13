//
//  Throwable.swift
//  JASON
//
//  Created by Damien on 27/01/2017.
//  Copyright © 2017 Damien. All rights reserved.
//

import Foundation

public enum Error<T: Any>: Swift.Error, CustomStringConvertible {
    case missingKey(JASON.Key<T>)
    case missingValue(JASON.Key<T>)
    case castingValue(JASON.Key<T>, Any)
    case dateFormatting(JASON.Key<T>, Any, String)

    public var description: String {
        switch self {
        case let .missingKey(key):
            return "Missing key '\(key.type)'"
        case let .missingValue(key):
            return "Missing value '\(key.type)'"
        case let .castingValue(key, value):
            return "Casting error '\(key.type)'. Received \(value)"
        case let .dateFormatting(key, value, format):
            return "Date formatting error '\(key.type)'. Received \(value). Expected format \(format)"
        }
    }

    public var localizedDescription: String {
        return description
    }
}

extension JSON {
    public func get<T>(_ key: String) throws -> T {
        return try get(JASON.Key<T>(key))
    }

    public func get<T>(_ key: Int) throws -> T {
        return try get(JASON.Key<T>(key))
    }

    public func get<T>(path indexes: Any...) throws -> T {
        return try get(JASON.Key<T>(indexes: indexes))
    }

    // Float

    public func get(_ key: String) throws -> Float {
        return try get(JASON.Key<Float>(key))
    }

    public func get(_ key: Int) throws -> Float {
        return try get(JASON.Key<Float>(key))
    }

    public func get(path indexes: Any...) throws -> Float {
        return try get(JASON.Key<Float>(indexes: indexes))
    }

    // Dictionary

    public func get(_ key: String) throws -> [String: Any] {
        return try get(JASON.Key<[String: Any]>(key))
    }

    public func get(_ key: Int) throws -> [String: Any] {
        return try get(JASON.Key<[String: Any]>(key))
    }

    public func get(path indexes: Any...) throws -> [String: Any] {
        return try get(JASON.Key<[String: Any]>(indexes: indexes))
    }

    // Date

    public func get(_ key: String, formatter: DateFormatter? = nil) throws -> Date {
        return try get(JASON.Key<Date>(key), formatter: formatter)
    }

    public func get(_ key: Int, formatter: DateFormatter? = nil) throws -> Date {
        return try get(JASON.Key<Date>(key), formatter: formatter)
    }

    public func get(path indexes: Any..., formatter: DateFormatter? = nil) throws -> Date {
        return try get(JASON.Key<Date>(indexes: indexes), formatter: formatter)
    }

    // JSON

    public func get(_ key: String) throws -> JSON {
        return try get(JASON.Key<JSON>(key))
    }

    public func get(_ key: Int) throws -> JSON {
        return try get(JASON.Key<JSON>(key))
    }

    public func get(path indexes: Any...) throws -> JSON {
        return try get(JASON.Key<JSON>(indexes: indexes))
    }

    // Array JSON

    public func get(_ key: String) throws -> [JSON] {
        return try get(JASON.Key<[JSON]>(key))
    }

    public func get(_ key: Int) throws -> [JSON] {
        return try get(JASON.Key<[JSON]>(key))
    }

    public func get(path indexes: Any...) throws -> [JSON] {
        return try get(JASON.Key<[JSON]>(indexes: indexes))
    }

    // Dictionary JSON

    public func get(_ key: String) throws -> [String: JSON] {
        return try get(JASON.Key<[String: JSON]>(key))
    }

    public func get(_ key: Int) throws -> [String: JSON] {
        return try get(JASON.Key<[String: JSON]>(key))
    }

    public func get(path indexes: Any...) throws -> [String: JSON] {
        return try get(JASON.Key<[String: JSON]>(indexes: indexes))
    }

    public func get<T>(_ key: JASON.Key<T>) throws -> T {
        guard let object = self[key.type].object else {
            throw Error.missingKey(key)
        }

        if object is NSNull {
            throw Error.missingValue(key)
        }

        guard let value = object as? T else {
            throw Error.castingValue(key, object)
        }

        return value
    }

    public func get<T>(_ key: JASON.Key<[T]>) throws -> [T] {
        guard let object = self[key.type].object else {
            throw Error.missingKey(key)
        }

        if object is NSNull {
            throw Error.missingValue(key)
        }

        guard let value = object as? [T] else {
            throw Error.castingValue(key, object)
        }

        return value
    }
    
    public func get(_ key: JASON.Key<Float>) throws -> Float {
        guard let object = self[key.type].object else {
            throw Error.missingKey(key)
        }

        if object is NSNull {
            throw Error.missingValue(key)
        }

        guard let value = object as? NSNumber else {
            throw Error.castingValue(key, object)
        }

        return value.floatValue
    }

    public func get(_ key: JASON.Key<[String: Any]>) throws -> [String: Any] {
        guard let object = self[key.type].object else {
            throw Error.missingKey(key)
        }

        if object is NSNull {
            throw Error.missingValue(key)
        }

        guard let value = object as? [String: Any] else {
            throw Error.castingValue(key, object)
        }

        return value
    }

    public func get(_ key: JASON.Key<Date>, formatter: DateFormatter? = nil) throws -> Date {
        guard let object = self[key.type].object else {
            throw Error.missingKey(key)
        }

        if object is NSNull {
            throw Error.missingValue(key)
        }

        guard let string = object as? String else {
            throw Error.castingValue(key, object)
        }
        
        let formatter = formatter ?? JSON.dateFormatter

        guard let date = formatter.date(from: string) else {
            throw Error.dateFormatting(key, object, formatter.dateFormat)
        }

        return date
    }

    public func get(_ key: JASON.Key<JSON>) throws -> JSON {
        guard let object = self[key.type].object else {
            throw Error.missingKey(key)
        }

        if object is NSNull {
            throw Error.missingValue(key)
        }

        return JSON(object)
    }

    public func get(_ key: JASON.Key<[JSON]>) throws -> [JSON] {
        guard let object = self[key.type].object else {
            throw Error.missingKey(key)
        }

        if object is NSNull {
            throw Error.missingValue(key)
        }

        guard let array = object as? [Any] else {
            throw Error.castingValue(key, object)
        }

        return array.map { JSON($0) }
    }

    public func get(_ key: JASON.Key<[String: JSON]>) throws -> [String: JSON] {
        guard let object = self[key.type].object else {
            throw Error.missingKey(key)
        }

        if object is NSNull {
            throw Error.missingValue(key)
        }

        guard let dictionary = object as? [String: Any] else {
            throw Error.castingValue(key, object)
        }

        return dictionary.reduceValues { JSON($0) }
    }
}
