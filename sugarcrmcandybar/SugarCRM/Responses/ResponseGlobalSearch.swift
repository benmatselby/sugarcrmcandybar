//
//  ResponseGlobalSearch.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 06/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/// Represents the response from the /globalsearch API call
class ResponseGlobalSearch: Response {
    
    /// Json from the API call
    let json: JSON

    /// The set of records from the CRM API
    var records: [RecordBase] = []

    /// Was the request successful
    var successful: Bool = true

    /// The earch term used for the url
    var searchTerm: String = ""

    /// Initialiser for the response
    ///
    /// - Parameter json: Raw Json response from API call
    required init(json: JSON) {
        self.json = json
        let jsonRecords = json["records"].array

        if (jsonRecords != nil) {
            for record in jsonRecords! {
                records.append(RecordMapper().getRecord(record: record))
            }
        } else {
            self.successful = false
        }
    }

    /// Get the raw Json response from the SugarCRM API
    ///
    /// - Returns: Json from the API
    func getRaw() -> JSON {
        return self.json
    }

    /// Getter for the records
    ///
    /// - Returns: Array of CRM records
    func getRecords() -> [RecordBase] {
        if (self.records.count > 0) {
            let all = RecordViewAll()
            all.setSearchTerm(term: self.searchTerm)
            records.append(all)
        }
        return self.records
    }

    /// Was the request successful
    ///
    /// - Returns: Whether or not the request resulted in a succesful response
    func wasSuccessful() -> Bool {
        return self.successful
    }

    /// Set the search term for the getUrl
    ///
    /// - Parameter term: The search term
    func setSearchTerm(term: String) {
        self.searchTerm = term
    }
}
