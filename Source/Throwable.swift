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
    
    // public func get(_ key: JASON.Key<String>) throws -> String {
    //     guard let object = self[key.type].object else {
    //         throw Error.missing(key)
    //     }

    //     guard let value = object as? String else {
    //         throw Error.casting(key)
    //     }

    //     return value
    // }

    public func get(_ key: JASON.Key<Int>) throws -> Int {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let value = object as? Int else {
            throw Error.casting(key)
        }

        return value
    }

    public func get(_ key: JASON.Key<Double>) throws -> Double {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let value = object as? Double else {
            throw Error.casting(key)
        }

        return value
    }

    public func get(_ key: JASON.Key<Bool>) throws -> Bool {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let value = object as? Bool else {
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

    public func get(_ key: JASON.Key<NSNumber>) throws -> NSNumber {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let value = object as? NSNumber else {
            throw Error.casting(key)
        }

        return value
    }

    public func get(_ key: JASON.Key<[Any]>) throws -> [Any] {
        guard let object = self[key.type].object else {
            throw Error.missing(key)
        }

        guard let value = object as? [Any] else {
            throw Error.casting(key)
        }

        return value
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
}
