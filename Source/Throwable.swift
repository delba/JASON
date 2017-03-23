//
//  Throwable.swift
//  JASON
//
//  Created by Damien on 27/01/2017.
//  Copyright © 2017 Damien. All rights reserved.
//

import Foundation

enum Error<T: Any>: Swift.Error, CustomStringConvertible {
    case missingKey(JASON.Key<T>)
    case missingValue(JASON.Key<T>)
    case castingValue(JASON.Key<T>)
    case dateFormatting(JASON.Key<T>)

    var description: String {
        switch self {
        case let .missingKey(key):
            return "Missing key '\(key.type)'"
        case let .missingValue(key):
            return "Missing value '\(key.type)'"
        case let .castingValue(key):
            return "Casting error '\(key.type)'"
        case let .dateFormatting(key):
            return "Date formatting error '\(key.type)'"
        }
    }
}

extension JSON {
    public func get<T>(_ key: String) throws -> T {
        return try get(JASON.Key<T>(key))
    }

    public func get<T>(_ key: Int) throws -> T {
        return try get(JASON.Key<T>(key))
    }

    public func get<T>(path: Any...) throws -> T {
        return try get(JASON.Key<T>(path: path))
    }

    // Float

    public func get(_ key: String) throws -> Float {
        return try get(JASON.Key<Float>(key))
    }

    public func get(_ key: Int) throws -> Float {
        return try get(JASON.Key<Float>(key))
    }

    public func get(path: Any...) throws -> Float {
        return try get(JASON.Key<Float>(path: path))
    }

    // Dictionary

    public func get(_ key: String) throws -> [String: Any] {
        return try get(JASON.Key<[String: Any]>(key))
    }

    public func get(_ key: Int) throws -> [String: Any] {
        return try get(JASON.Key<[String: Any]>(key))
    }

    public func get(path: Any...) throws -> [String: Any] {
        return try get(JASON.Key<[String: Any]>(path: path))
    }

    // Date

    public func get(_ key: String) throws -> Date {
        return try get(JASON.Key<Date>(key))
    }

    public func get(_ key: Int) throws -> Date {
        return try get(JASON.Key<Date>(key))
    }

    public func get(path: Any...) throws -> Date {
        return try get(JASON.Key<Date>(path: path))
    }

    // JSON

    public func get(_ key: String) throws -> JSON {
        return try get(JASON.Key<JSON>(key))
    }

    public func get(_ key: Int) throws -> JSON {
        return try get(JASON.Key<JSON>(key))
    }

    public func get(path: Any...) throws -> JSON {
        return try get(JASON.Key<JSON>(path: path))
    }

    // Array JSON

    public func get(_ key: String) throws -> [JSON] {
        return try get(JASON.Key<[JSON]>(key))
    }

    public func get(_ key: Int) throws -> [JSON] {
        return try get(JASON.Key<[JSON]>(key))
    }

    public func get(path: Any...) throws -> [JSON] {
        return try get(JASON.Key<[JSON]>(path: path))
    }

    // Dictionary JSON

    public func get(_ key: String) throws -> [String: JSON] {
        return try get(JASON.Key<[String: JSON]>(key))
    }

    public func get(_ key: Int) throws -> [String: JSON] {
        return try get(JASON.Key<[String: JSON]>(key))
    }

    public func get(path: Any...) throws -> [String: JSON] {
        return try get(JASON.Key<[String: JSON]>(path: path))
    }

    public func get<T>(_ key: JASON.Key<T>) throws -> T {
        guard let object = self[key.type].object else {
            throw Error.missingKey(key)
        }

        if object is NSNull {
            throw Error.missingValue(key)
        }

        guard let value = object as? T else {
            throw Error.castingValue(key)
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
            throw Error.castingValue(key)
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
            throw Error.castingValue(key)
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
            throw Error.castingValue(key)
        }

        return value
    }

    public func get(_ key: JASON.Key<Date>) throws -> Date {
        guard let object = self[key.type].object else {
            throw Error.missingKey(key)
        }

        if object is NSNull {
            throw Error.missingValue(key)
        }

        guard let string = object as? String else {
            throw Error.castingValue(key)
        }

        guard let date = JSON.dateFormatter.date(from: string) else {
            throw Error.dateFormatting(key)
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
            throw Error.castingValue(key)
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
            throw Error.castingValue(key)
        }

        return dictionary.reduceValues { JSON($0) }
    }
}
