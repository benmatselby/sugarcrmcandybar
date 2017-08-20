//
//  RequestOAuthToken.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 05/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/**
 Represents a request onto the /oauth2/token API end point
 */
class RequestOAuthToken: Request {
    /**
     SugarCRM instance
     */
    var instance: SugarCrmInstance

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
        let endpoint = URL.init(string: instance.getRestUrl()+"/oauth2/token")
        let parameters = [
            "username": instance.getUsername(),
            "password": instance.getPassword(),
            "platform": instance.getPlatform(),
            "grant_type": "password",
            "client_id": "sugar"
        ]
        var request = URLRequest.init(url: endpoint!)
        request.httpMethod = "post"
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        // Set the headers, this stopped the application working for some time
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }

    /**
     Getter for the response. This takes the data from the HttpRequest
     and transforms it into whatever is necessary for the call
     */
    func getResponse(data: Data, response: HTTPURLResponse) -> Response {
        let json = JSON(data: data, options: [], error: nil)
        let response = ResponseOAuthToken(json: json)

        return response
    }
}
