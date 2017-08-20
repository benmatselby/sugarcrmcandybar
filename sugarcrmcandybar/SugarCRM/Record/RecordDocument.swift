//
//  RecordDocument.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 13/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/**
 Document record defines the name as document_name
 */
class RecordDocument : RecordBase {

    override func getName() -> String {
        if let name = self.rawRecord["document_name"].string {
            return name
        }
        return ""
    }
}
