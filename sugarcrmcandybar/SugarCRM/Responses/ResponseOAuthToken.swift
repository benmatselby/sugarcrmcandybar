//
//  ResponseOAuthToken.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 06/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/// Represents the response from the /oauth2/token API call
class ResponseOAuthToken: Response {

    /// Json from the API call
    let json: JSON

    /// The OAuth Access token
    var accessToken: String = ""

    /// Was the request successful
    var successful: Bool = true

    /// Initialiser for the response
    ///
    /// - Parameter json: Raw Json response from API call
    required init(json: JSON) {
        self.json = json

        if (json["access_token"].string != nil) {
            self.accessToken = json["access_token"].string!
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

    /// Getter for the OAuthToken
    ///
    /// - Returns: The OAuth Token
    func getAccessToken() -> String {
        return self.accessToken
    }

    /// Was the request successful
    ///
    /// - Returns: Whether or not the request resulted in a succesful response
    func wasSuccessful() -> Bool {
        return self.successful
    }
}
