//
//  Response.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 06/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/**
 The protocol for responses from the CRM system
 */
protocol Response {
    /**
     Initialiser of the response
     */
    init(json: JSON)

    /**
     Getter for the JSON raw response from SugarCRM
     */
    func getRaw() -> JSON

    /// Was the request successful
    ///
    /// - Returns: Whether or not the request resulted in a succesful response
    func wasSuccessful() -> Bool
}
