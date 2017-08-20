//
//  RequestGetMe.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 05/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/**
 Represents a request onto the /me API endpoint
 */
class RequestGetMe: Request {
    /**
     SugarCRM instance
     */
    var instance: SugarCrmInstance

    /**
     The GUID of the user from /me
     */
    var id: String = ""

    /**
     Initialiser of the request
     */
    required init(crmInstance: SugarCrmInstance) {
        instance = crmInstance
    }

    /**
     Getter for the URL Request within the Request.
     Essentially this allows each Request to do what is necessary to
     interact with SugarCRM
     */
    func getHttpRequest() -> URLRequest {
        // Setup the auth endpoint
        let endpoint = URL.init(string: instance.getRestUrl()+"/me")
        let request = URLRequest.init(url: endpoint!)
        return request
    }

    /**
     Getter for the response. This takes the data from the HttpRequest
     and transforms it into whatever is necessary for the call
     */
    func getResponse(data: Data, response: HTTPURLResponse) -> Response {
        let json = JSON(data: data, options: [], error: nil)
        let response = ResponseGetMe(json: json)

        return response
    }
}
