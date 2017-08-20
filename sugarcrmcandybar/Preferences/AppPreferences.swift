//
//  AppPreferences.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 12/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation
import Cocoa

/**
 Represents the application preferences
 */
class AppPreferences {
    var appearanceName: String
    var defaults: UserDefaults = UserDefaults.standard

    /**
     Initialisers the preferences
     */
    init() {

        self.appearanceName = defaults.string(forKey: "appearanceName") ?? "Light"
    }

    /**
     Getter for the Appearance of the UI in search mode

     - returns: Appearance Name
     */
    func getAppearanceName() -> String {
        return self.appearanceName
    }

    /// Getter for the NSAppearanceNameVibrant* value from the preference name
    ///
    /// - Returns: String
    func getNsAppearanceName() -> String {
        if (self.appearanceName == "Dark") {
            return NSAppearanceNameVibrantDark
        } else {
            return NSAppearanceNameVibrantLight
        }
    }

    /**
     Setter for the Appearance of the UI in search mode

     - parameter name: The name of the appearance
     */
    func setAppearanceName(name: String) -> Void {
        self.appearanceName = name
        defaults.set(self.appearanceName, forKey: "appearanceName")
    }
}
