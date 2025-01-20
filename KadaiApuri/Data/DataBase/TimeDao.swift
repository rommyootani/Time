//
//  TimeDao.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import CoreData
import Foundation

protocol TimeDaoProtocol: AnyObject {
    func register(someTime: Int16, startTime: Int16, endTime: Int16, result: Bool) -> Bool
    func getAll() -> [Time]
}

final class TimeDao: TimeDaoProtocol {
    // MARK: Public Methods

    func getAll() -> [Time] {
        let fetchRequest: NSFetchRequest<TimeData> = TimeData.fetchRequest()
        var newList: [Time] = []
        do {
            let list = try CoreDataStack.shared.context.fetch(fetchRequest)
            for time in list {
                let newTime = Time(evaluatedTime: Int(time.evaluatedTime), startTime: Int(time.startTime), endTime: Int(time.endTime), result: time.result, timestamp: time.timestamp)
                newList.append(newTime)
            }
        } catch {
            print("Failed to fetch people: \(error)")
        }
        return newList
    }

    func register(someTime: Int16, startTime: Int16, endTime: Int16, result: Bool) -> Bool {
        // Define a new Person entity
        let newTime = NSEntityDescription.insertNewObject(forEntityName: "TimeData", into: CoreDataStack.shared.context) as? TimeData
        newTime?.startTime = startTime
        newTime?.endTime = endTime
        newTime?.evaluatedTime = someTime
        newTime?.timestamp = Date()
        newTime?.result = result

        // Save the context
        CoreDataStack.shared.saveContext()
        return true
    }
}
