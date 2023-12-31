//
//  CKpost.swift
//  rumor
//
//  Created by Albert Zhou on 11/19/23.
//

import Foundation
import CloudKit

class CKpost{
    static let database = CKContainer.default().publicCloudDatabase
    
    class func fetch(title:String) async throws->[post]{
        let predicate = NSPredicate(format:"\(postRecordKeys.title.rawValue) == %@",title)
        let time = NSSortDescriptor(key:"time",ascending:false)
        let query = CKQuery(recordType: "post", predicate: predicate)
        query.sortDescriptors=[time]
        let result = try await database.records(matching: query)
        let records = result.matchResults.compactMap{try? $0.1.get()}
        return records.compactMap(post.init)
    }
    func save(_ record: CKRecord) async throws{
        try await CKContainer.default().publicCloudDatabase.save(record)
    }
    
    class func fetch(user:String) async throws->[post]{
        let predicate = NSPredicate(format:"\(postRecordKeys.user.rawValue) == %@",user)
        let time = NSSortDescriptor(key:"time",ascending:false)
        let query = CKQuery(recordType: "post", predicate: predicate)
        query.sortDescriptors=[time]
        let result = try await database.records(matching: query)
        let records = result.matchResults.compactMap{try? $0.1.get()}
        return records.compactMap(post.init)
    }
    func save(record: CKRecord) async throws{
        try await CKContainer.default().publicCloudDatabase.save(record)
    }
}
