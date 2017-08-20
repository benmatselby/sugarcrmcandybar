//
//  RequestGlobalSearch.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 05/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/**
 Represents a request onto the /globalsearch API end point
 */
class RequestGlobalSearch: Request {
    var instance: SugarCrmInstance
    var query: String = ""
    var module: String = ""

    /**
     Initialiser of the request
     */
    required init(crmInstance: SugarCrmInstance) {
        instance = crmInstance
    }

    /**
     Initialiser of the request
     */
    init(crmInstance: SugarCrmInstance, searchQuery: String) {
        query = searchQuery
        instance = crmInstance
    }

    /// Set the module limiter if applicable
    ///
    /// - Parameter module: The name of the module we want to restrict the search to
    func setModule(module: String) {
        self.module = module
    }

    /**
     Getter for the URL Request within the Request.
     Essentially this allows each Request to do what is necessary to
     interact with SugarCRM
     */
    func getHttpRequest() -> URLRequest {
        var url: String = instance.getRestUrl()+self.getSpecificEndPoint()
        url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let endpoint = URL.init(string: url)
        var request = URLRequest.init(url: endpoint!)
        request.httpMethod = "get"

        return request
    }

    /**
     Getter for the response. This takes the data from the HttpRequest
     and transforms it into whatever is necessary for the call
     */
    func getResponse(data: Data, response: HTTPURLResponse) -> Response {
        let json = JSON(data: data, options: [], error: nil)
        let response = ResponseGlobalSearch(json: json)
        response.setSearchTerm(term: self.query)

        return response
    }

    /// Getter for the specific end point
    /// Which basically means are we module limiting the search
    ///
    /// - Returns: The end point
    func getSpecificEndPoint() -> String {
        let search = "/globalsearch?q="+query
        if (self.module != "") {
            return search+"&module_list="+self.module
        }
        return search
    }
 }
