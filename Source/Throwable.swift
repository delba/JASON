//
//  Throwable.swift
//  JASON
//
//  Created by Damien on 27/01/2017.
//  Copyright © 2017 Damien. All rights reserved.
//

import Foundation

enum Error<T: Any>: Swift.Error, CustomStringConvertible {
    case missing(JASON.Key<T>)
    case casting(JASON.Key<T>)

    var description: String {
        switch self {
        case let .missing(key):
            return "Missing key \(key.type)"
        case let .casting(key):
            return "Casting error \(key.type)"
        }
    }
}

extension JSON {
    public func get<T>(_ key: JASON.Key<T>) throws -> T {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let value = object as? T else {
            throw Error.casting(key)
        }

        return value
    }

    public func get<T>(_ key: JASON.Key<[T]>) throws -> [T] {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let value = object as? [T] else {
            throw Error.casting(key)
        }

        return value
    }
    
    public func get(_ key: JASON.Key<Float>) throws -> Float {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let value = object as? NSNumber else {
            throw Error.casting(key)
        }

        return value.floatValue
    }

    public func get(_ key: JASON.Key<[String: Any]>) throws -> [String: Any] {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let value = object as? [String: Any] else {
            throw Error.casting(key)
        }

        return value
    }

    public func get(_ key: JASON.Key<Date>) throws -> Date {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let string = object as? String else {
            throw Error.casting(key)
        }

        guard let date = JSON.dateFormatter.date(from: string) else {
            throw Error.casting(key)
        }

        return date
    }

    public func get(_ key: JASON.Key<JSON>) throws -> JSON {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        return JSON(object)
    }

    public func get(_ key: JASON.Key<[JSON]>) throws -> [JSON] {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let array = object as? [Any] else {
            throw Error.casting(key)
        }

        return array.map { JSON($0) }
    }

    public func get(_ key: JASON.Key<[String: JSON]>) throws -> [String: JSON] {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let dictionary = object as? [String: Any] else {
            throw Error.casting(key)
        }

        return dictionary.reduceValues { JSON($0) }
    }
}
