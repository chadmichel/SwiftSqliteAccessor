//
//  SqliteTest3Tests.swift
//  SqliteTest3Tests
//
//  Created by Chad Michel on 1/3/15.
//  Copyright (c) 2015 Chad Michel. All rights reserved.
//

import UIKit
import XCTest


class QuestionSetAccessor: XCTestCase {
    
    var accessor : QuestionSetAccessor? = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //accessor = Factory.CreateQuestionSetAccessor()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func SaveNewItem() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
