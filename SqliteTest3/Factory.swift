//
//  Factory.swift
//  SqliteTest3
//
//  Created by Chad Michel on 1/4/15.
//  Copyright (c) 2015 Chad Michel. All rights reserved.
//

import Foundation

struct Factory {
    
    static var questionSetAccessor: QuestionSetAccessor? = nil
    
    static func CreateQuestionSetAccessor() -> QuestionSetAccessor    {
        if questionSetAccessor == nil {
            questionSetAccessor = QuestionSetAccessor()
        }
        return questionSetAccessor!
    }
    
}