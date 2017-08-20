//
//  ResponseGetMe.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 06/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/// Represents the response from the /me API call
class ResponseGetMe: Response {

    /// Json from the API call
    let json: JSON

    /// Guid
    var userId: String = ""

    /// Was the request successful
    var successful: Bool = true

    /// Initialiser for the response
    ///
    /// - Parameter json: The Json response from the SugarCRM API
    required init(json: JSON) {
        self.json = json
        let currentUser = json["current_user"]
        if (currentUser["id"].string != nil) {
            self.userId = currentUser["id"].string!
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

    /// Getter for the current user id
    ///
    /// - Returns: The GUID of the user from the /me API call
    func getUserId() -> String {
        return self.userId
    }

    /// Was the request successful
    ///
    /// - Returns: Whether or not the request resulted in a succesful response
    func wasSuccessful() -> Bool {
        return self.successful
    }
}
