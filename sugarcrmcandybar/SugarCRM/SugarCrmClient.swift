//
//  SugarCrmClient.swift
//  sugarcandybar
//
//  Created by Ben Selby on 15/10/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/**
 Responsible for taking Request objects and then interating with the SugarCRM
 platform based on what the Request wants to do
 */
class SugarCrmClient {
    /**
     The SugarCRM instance we are interacting with
     */
    var instance: SugarCrmInstance

    /**
     Responsible for initialising the client

     - parameter instance: The SugarCRM instance we are interacting with
     */
    init (instance: SugarCrmInstance) {
        self.instance = instance
    }

    /**
     Responsible for mapping a raw result record to a RecordBase class or child

     - parameter clientRequest: This is the raw record from the SugarCRM system

     - parameter success: Callback with what to do with the response from the HTTP Call
     */
    func makeRequest(clientRequest: Request, success: @escaping (Any) -> Void) {
        let session = URLSession.shared
        let authRequest = RequestOAuthToken(crmInstance: self.instance)
        let authHttpRequest = authRequest.getHttpRequest()

        NSLog("\(authHttpRequest)")
        // Call the auth end point
        let authTask = session.dataTask(with: authHttpRequest) { (data, response, err) in
            // Parse the auth request/response
            if (response as? HTTPURLResponse) != nil {
                let authResponse = authRequest.getResponse(data: data!, response: response as! HTTPURLResponse) as! ResponseOAuthToken

                if (!authResponse.wasSuccessful()) {
                    success(authResponse)
                    return
                }

                var httpRequest = clientRequest.getHttpRequest()
                httpRequest.setValue(authResponse.getAccessToken(), forHTTPHeaderField: "OAuth-Token")
                NSLog("\(httpRequest)")
                
                // Now run the end point we really want to hit
                let clientTask = session.dataTask(with: httpRequest) { data, response, err in
                    let data = clientRequest.getResponse(data: data!, response: response as! HTTPURLResponse)
                    success(data)
                }
                clientTask.resume()
            }
        }
        authTask.resume()
    }
}
