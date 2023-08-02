import Foundation
import SQLite

class SQLiteHandler {
    static let shared = SQLiteHandler()
    
    private var db: Connection?
    private let path: String = {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        return documentsPath.appendingPathComponent("WeightRecord.db")
    }()
    
    private enum RecordTable {
        static let tableName = Table("weight_records")
        static let id = Expression<Int64>("id")
        static let date = Expression<Date>("date")
        static let weight = Expression<Double>("weight")
        static let sport = Expression<Bool>("sport")
        static let description = Expression<String>("description")
    }
    
    private init() {
        do {
            db = try Connection(path)
            
            try db?.run(RecordTable.tableName.create(ifNotExists: true) { table in
                table.column(RecordTable.id, primaryKey: true)
                table.column(RecordTable.date)
                table.column(RecordTable.weight)
                table.column(RecordTable.sport)
                table.column(RecordTable.description)
            })
        } catch {
            print("[Error] Cann't connecting to database: \(error)")
        }
    }
    
    func insertWeightRecord(record: WeightRecord) {
        do {
            let insert = RecordTable.tableName.insert(
                RecordTable.date <- record.date,
                RecordTable.weight <- record.weight,
                RecordTable.sport <- record.sport,
                RecordTable.description <- record.description
            )
            try db?.run(insert)
        } catch {
            print("[Error] Cann't insert new record to database: \(error)")
        }
    }

    func getAllWeightRecords() -> [WeightRecord] {
        var records: [WeightRecord] = []
        do {
            for record in try db!.prepare(RecordTable.tableName) {
                records.append(WeightRecord(
                    id: record[RecordTable.id],
                    date: record[RecordTable.date],
                    weight: record[RecordTable.weight],
                    sport: record[RecordTable.sport],
                    description: record[RecordTable.description]
                ))
            }
        } catch {
            print("[Error] Cann't get all records from database: \(error)")
        }
        return records
    }
    
    func updateWeightRecord(record: WeightRecord) {
        do {
            let recordToUpdate = RecordTable.tableName.filter(RecordTable.id == record.id)
            try db?.run(recordToUpdate.update(
                RecordTable.date <- record.date,
                RecordTable.weight <- record.weight,
                RecordTable.sport <- record.sport,
                RecordTable.description <- record.description
            ))
        } catch {
            print("[Error] Cann't update record to database: \(error)")
        }
    }

    func deleteWeightRecord(record: WeightRecord) {
        do {
            let recordToDelete = RecordTable.tableName.filter(RecordTable.id == record.id)
            try db?.run(recordToDelete.delete())
        } catch {
            print("[Error] Cann't delete record  database: \(error)")
        }
    }
    
    
    
    
    
    
}
