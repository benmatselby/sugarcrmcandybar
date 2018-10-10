//
//  StatusMenuController.swift
//  SugarCRM Candy Bar
//
//  Created by Ben Selby on 02/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    @IBOutlet weak var appMenu: NSMenu!

    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon");
        icon?.isTemplate = true
        statusItem.image = icon
        statusItem.menu = appMenu
    }


    // MARK: - Actions
    @IBAction func preferencesClicked(_ sender: NSMenuItem) {
        let appDelegate = NSApplication.shared.delegate as! AppDelegate
        appDelegate.showPreferencesWindow()

    }

    @IBAction func gotoClicked(_ sender: NSMenuItem) {
        let sugarInstance: SugarCrmInstance = SugarCrmInstance()
        NSWorkspace.shared.open(URL(string: sugarInstance.getUrl())!)
    }

    @IBAction func searchClicked(_ sender: NSMenuItem) {
        let appDelegate = NSApplication.shared.delegate as! AppDelegate
        appDelegate.showResultsWindow()
    }

    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
}
