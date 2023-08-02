import XCTest
@testable import WeightRecord


final class SQLiteHandlerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInsertAndRetrieveRecord() throws {
        let record = WeightRecord(id: 1, date: Date(), weight: 81.7, sport: true, description: "")
        
        SQLiteHandler.shared.insertWeightRecord(record: record)
        
        let records = SQLiteHandler.shared.getAllWeightRecords()
        
        XCTAssertEqual(records.count, 1)
        XCTAssertEqual(records.first?.id, 1)
        XCTAssertEqual(records.first?.weight, 81.7)
    }

    func testUpdateRecord() throws {
        let record = WeightRecord(id: 1, date: Date(), weight: 83.7, sport: true, description: "new")
        
        SQLiteHandler.shared.updateWeightRecord(record: record)
        
        let records = SQLiteHandler.shared.getAllWeightRecords()
        
        XCTAssertEqual(records.count, 1)
        XCTAssertEqual(records.first?.id, 1)
        XCTAssertEqual(records.first?.weight, 83.7)
        XCTAssertEqual(records.first?.description, "new")
    }
    
    func testDeleteRecord() throws {
        SQLiteHandler.shared.deleteWeightRecord(recordID: 1)
        
        let records = SQLiteHandler.shared.getAllWeightRecords()
        
        XCTAssertEqual(records.count, 0)
    }

}
