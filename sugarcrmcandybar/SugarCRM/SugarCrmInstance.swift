//
//  SugarCrmInstance.swift
//  sugarcandybar
//
//  Created by Ben Selby on 23/10/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/**
 Represents a SugarCRM installation
 */
class SugarCrmInstance {
    var url: String
    var username: String
    var platform: String
    var defaults: UserDefaults = UserDefaults.standard

    /**
     Initialisers the Instance object
     */
    init() {
        self.url = defaults.string(forKey: "crmUrl") ?? ""
        self.username = defaults.string(forKey: "crmUsername") ?? ""
        self.platform = defaults.string(forKey: "crmPlatform") ?? "sugarcandybar"
    }

    /**
     Getter for the URL of the SugarCRM instance

     - returns: SugarCRM Url
     */
    func getUrl() -> String {
        return self.url
    }

    /**
     Setter for the URL of the SugarCRM instance

     - parameter url: The url we want to use
     */
    func setUrl(url: String) -> Void {
        self.url = url
        defaults.set(self.url, forKey: "crmUrl")
    }

    /**
     Getter for the Rest URL of the SugarCRM instance.
     Essentiall appends the versioning of the API
     */
    func getRestUrl() -> String {
        return self.getUrl()+"/rest/v10"
    }

    /**
     Getter for the username
     */
    func getUsername() -> String {
        return self.username
    }

    /**
     Setter for the Username

     - parameter username: The username
     */
    func setUsername(username: String) -> Void {
        self.username = username
        defaults.set(self.username, forKey: "crmUsername")
    }

    /**
     Getter for the password
     */
    func getPassword() -> String {
        return Keychain.getPassword(url: self.getUrl(), identifier: Bundle.main.bundleIdentifier ?? "")
    }

    /**
     Setter for the password

     - parameter password: The password
     */
    func setPassword(password: String) -> Void {
        Keychain.setPassword(
            url: self.getUrl(),
            password: password,
            identifier: Bundle.main.bundleIdentifier ?? ""
        )
    }

    /**
     Getter for the platform of the SugarCRM instance.
     This is used to allow different "clients" to keep the same user logged in
     by specificing something other than "sugar" it means the user can use this
     and the web browser at the same time. That's very important, since this application
     redirects to the web client
     */
    func getPlatform() -> String {
        return self.platform
    }

    /**
     Setter for the platform

     - parameter platform: The platform
     */
    func setPlatform(platform: String) -> Void {
        self.platform = platform
    }

    /**
     Are the credentials needed to interact with SugarCRM set
     */
    func areCredentialsSet() -> Bool {
        if (self.getUsername() != "" && self.getPassword() != "" && self.getUrl() != "") {
            return true;
        }

        return false
    }
}
