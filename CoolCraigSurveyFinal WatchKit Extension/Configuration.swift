//
//  Configuration.swift
//  coolcraig WatchKit Extension
//
//  Created by InfProjCourse1 on 11/5/19.
//

import Foundation

enum Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

enum Environment {

    static var FIREBASE_API_KEY: String {
        return try! Configuration.value(for: "FIREBASE_API_KEY")
    }
    
}
