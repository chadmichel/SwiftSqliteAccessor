//
//  Extensions.swift
//  SqliteTest3
//
//  Created by Chad Michel on 1/4/15.
//  Copyright (c) 2015 Chad Michel. All rights reserved.
//

import UIKit
import Foundation
import SQLite

extension NSDate: Value {
    public class var declaredDatatype: String {
        return Int.declaredDatatype
    }
    public class func fromDatatypeValue(intValue: Int) -> Self {
        return self(timeIntervalSince1970: NSTimeInterval(intValue))
    }
    public var datatypeValue: Int {
        return Int(timeIntervalSince1970)
    }
}