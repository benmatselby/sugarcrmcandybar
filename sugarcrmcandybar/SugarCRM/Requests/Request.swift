//
//  Request.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 05/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/**
 The protocol for requests to the CRM system
 */
protocol Request {
    /**
     Initialiser of the request
     */
    init(crmInstance: SugarCrmInstance)

    /**
     Getter for the URL Request within the Request.
     Essentially this allows each Request to do what is necessary to
     interact with SugarCRM
     */
    func getHttpRequest() -> URLRequest

    /**
     Getter for the response. This takes the data from the HttpRequest
     and transforms it into whatever is necessary for the call
     */
    func getResponse(data: Data, response: HTTPURLResponse) -> Response
}
