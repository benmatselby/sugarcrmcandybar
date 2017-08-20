//
//  RecordViewAll.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 18/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/// View all record representation
class RecordViewAll : RecordBase {

    /// The earch term used for the url
    var searchTerm: String = ""

    /// Overriden init so we can mock up a dummy view
    init() {
        let jsonStructure: JSON = [
            "id": "",
            "name": "View all records",
            "description": "View the search result in SugarCRM",
            "_module": "",
        ]

        super.init(rawRecord: jsonStructure)
    }

    /// Get the URL overriden from the base
    /// as this simply goes to the search URL in SugarCRM
    ///
    /// - Returns: The search url
    override func getUrl() -> String {
        return "#search/"+self.searchTerm
    }

    /// Set the search term for the getUrl
    ///
    /// - Parameter term: The search term
    func setSearchTerm(term: String) {
        self.searchTerm = term
    }
}
