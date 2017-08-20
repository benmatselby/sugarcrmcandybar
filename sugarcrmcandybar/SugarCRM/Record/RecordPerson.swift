//
//  RecordPerson.swift
//  sugarcandybar
//
//  Created by Ben Selby on 22/10/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/**
 Person record defines the name as first_name+last_name
 */
class RecordPerson : RecordBase {

    override func getName() -> String {
        var firstName = ""
        let json = self.getRaw()
        if (json["first_name"] != JSON.null) {
            firstName = json["first_name"].string!
        }

        var lastName = ""
        if (json["last_name"] != JSON.null) {
            lastName = json["last_name"].string!
        }

        var name: String = firstName+" "+lastName
        name = name.trimmingCharacters(in: .whitespaces)

        if (name == "") {
            name = "Unknown"
        }

        return name
    }
}
