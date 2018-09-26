//
//  RecordBase.swift
//  sugarcandybar
//
//  Created by Ben Selby on 22/10/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/**
Base record class representing a search result record from SugarCRM
 */
class RecordBase {
    // The json response from SugarCRM
    var rawRecord: JSON

    /**
     Constructor that stores the json response from SugarCRM

     - parameter rawRecord
     */
    init(rawRecord: JSON) {
        self.rawRecord = rawRecord
    }

    /**
     Getter for the id of the record
     */
    func getId() -> String {
        if let id = self.rawRecord["id"].string {
            return id
        }
        return ""
    }

    /**
     Getter for the name of the record
     */
    func getName() -> String {
        if let name = self.rawRecord["name"].string {
            return name
        }
        return ""
    }

    /**
     Getter for the description of the record
     */
    func getDescription() -> String {
        if let description = self.rawRecord["description"].string {
            return description
        }
        return ""
    }

    /**
     Getter for the module of the record
     */
    func getModule() -> String {
        if let module = self.rawRecord["_module"].string {
            return module
        }
        return ""
    }

    /// Getter for the module icon name, so two letters that represent the module
    ///
    /// - Returns: 2 letters of text representing the module
    func getModuleIconText() -> String {
        let module = self.getModule()
        if (module == "") {
            return module
        }
        return String(module.prefix(2))
    }

    /**
     Getter for raw json response
     {
         id: "a8c2032e-86fe-11e6-9f45-00155daa9e55",
         name: "Apple Inc",
         date_modified: "2016-09-30T12:21:59+01:00",
         modified_user_id: "cf2ccf31-c04a-4087-7534-56447882999d",
         created_by: "cf2ccf31-c04a-4087-7534-56447882999d",
         description: "DFAFDS",
         team_set_id: "1",
         assigned_user_id: "cf2ccf31-c04a-4087-7534-56447882999d",
         _acl: { fields: { } },
         _module: "Accounts"
     },
     */
    func getRaw() -> JSON {
        return rawRecord
    }

    /// Get the URL for the record
    ///
    /// - Returns: The record URL
    func getUrl() -> String {
        return "/#"+self.getModule()+"/"+self.getId()
    }
}
