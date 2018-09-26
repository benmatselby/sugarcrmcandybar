//
//  SugarCrmModuleTableCell.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 20/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation
import Cocoa

/// The view for the module icon part of the results table
class SugarCrmModuleTableCell: NSTableCellView
{
    /// The module label within the view
    /// which will be set to two letters of the module
    @IBOutlet weak var moduleLabel: NSTextField!

    /// Set the letters and colouring of the view
    ///
    /// - Parameter module: The module of the record of the cell
    func setModule(module: String) {
        self.moduleLabel.stringValue = module
        var bgColour: NSColor = NSColor.black
        let txtColour: NSColor = NSColor.white
        var drawBg = true;

        switch module {
        case "Ac": // Accounts
            bgColour = NSColor(srgbRed: 0.2, green: 0.5, blue: 0.05, alpha: 1)
        case "Cl": // Calls
            bgColour = NSColor(srgbRed: 0.04, green: 0.21, blue: 0.44, alpha: 1)
        case "Ca": // Campaigns
            bgColour = NSColor(srgbRed: 0.27, green: 0.32, blue: 0.03, alpha: 1)
        case "Cs": // Cases
            bgColour = NSColor(srgbRed: 0.54, green: 0.05, blue: 0.05, alpha: 1)
        case "Co": // Contacts
            bgColour = NSColor(srgbRed: 0.13, green: 0.32, blue: 0.03, alpha: 1)
        case "Do": // Documents
            bgColour = NSColor(srgbRed: 0.44, green: 0.11, blue: 0.04, alpha: 1)
        case "AE": // Emails
            bgColour = NSColor(srgbRed: 0.07, green: 0.34, blue: 0.72, alpha: 1)
        case "Fo": // Forecasts
            bgColour = NSColor(srgbRed: 0.05, green: 0.50, blue: 0.27, alpha: 1)
        case "Le": // Leads
            bgColour = NSColor(srgbRed: 0.09, green: 0.43, blue: 0.90, alpha: 1)
        case "Me": // Meetings
            bgColour = NSColor(srgbRed: 0.03, green: 0.32, blue: 0.27, alpha: 1)
        case "Nt": // Notes
            bgColour = NSColor(srgbRed: 0.06, green: 0.47, blue: 0.60, alpha: 1)
        case "Op": // Opportunities
            bgColour = NSColor(srgbRed: 0.43, green: 0.09, blue: 0.90, alpha: 1)
        case "Pr": // Product
            bgColour = NSColor(srgbRed: 0.12, green: 0.07, blue: 0.70, alpha: 1)
        case "Qu": // Quotes
            bgColour = NSColor(srgbRed: 0.02, green: 0.23, blue: 0.13, alpha: 1)
        case "Re": // Reports
            bgColour = NSColor(srgbRed: 0.80, green: 0.20, blue: 0.08, alpha: 1)
        case "LI": // RevenueLineItems
            bgColour = NSColor(srgbRed: 0.25, green: 0.05, blue: 0.53, alpha: 1)
        case "Ts": // Tasks
            bgColour = NSColor(srgbRed: 0.90, green: 0.09, blue: 0.43, alpha: 1)
        case "": // No module
            drawBg = false
        default:
            bgColour = NSColor(srgbRed: 0.33, green: 0.33, blue: 0.33, alpha: 1)

        }

        self.moduleLabel.drawsBackground = drawBg
        self.moduleLabel.backgroundColor = bgColour
        self.moduleLabel.textColor = txtColour
    }
}
