# SwiftSqliteAccessor

A very basic SQLite test application I wrote in Swift. Relevant class is QuestionSetAccessor.swift.

To access SQLite I use SQLite.Swift. 
https://github.com/stephencelis/SQLite.swift


```swift

class QuestionSet {
    
    var id: Int = 0
    var title: String = ""
    var createdAt: NSDate = NSDate()
    var updatedAt: NSDate = NSDate()

}

class QuestionSetAccessor {
    
    var db: Database? = nil
    
    let id = Expression<Int>("id")
    let title = Expression<String?>("title")
    let createdAt = Expression<NSDate>("createdAt")
    let updatedAt = Expression<NSDate>("updatedAt")
    
    init() {
        
        let path = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory, .UserDomainMask, true
            ).first as String
        
        db = Database("\(path)/questionsets.sqlite3")
        
        if db!.userVersion == 0 {
            let questionSet = db!["questionset"]

            db!.create(table: questionSet) { t in
                t.column(self.id, primaryKey: true)
                t.column(self.title)
                t.column(self.createdAt, defaultValue: NSDate())
                t.column(self.updatedAt, defaultValue: NSDate())
            }
            
            db?.userVersion = 1
        }
    }
    
    func fromQuestionSetRow(row: Row) -> QuestionSet {
        var result = QuestionSet()
        result.id = row.get(id)
        result.title = row.get(title)!
        return result
    }

    func allQuestionSets() -> NSArray {
        
        var result = NSMutableArray()
        
        let questionSets = db!["questionset"]
        for questionSetRow in questionSets {
            var questionSet = fromQuestionSetRow(questionSetRow)
            result.addObject(questionSet)
        }
        
        return result
    }
    
    func save(questionSet: QuestionSet) {
        
        questionSet.updatedAt = NSDate()

        let questionSets = db!["questionset"]
        
        if questionSet.id <= 0 {
            
            questionSet.createdAt = NSDate()
            
            if let insertID = questionSets.insert(title <- questionSet.title, createdAt <- questionSet.createdAt, updatedAt <-  questionSet.updatedAt) {
                println("inserted id: \(insertID)")
                questionSet.id = insertID
            }
        } else {
            
            let existing = questionSets.filter(id == questionSet.id)
            existing.update(title <- questionSet.title, updatedAt <- questionSet.updatedAt)?
        }
    }
    
    func delete(questionSet: QuestionSet) {
        let questionSets = db!["questionset"]
        let existing = questionSets.filter(id == questionSet.id)
        existing.delete()?
    }
    
}

```

