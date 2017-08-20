//
//  AppDelegate.swift
//  SugarCRM Candy Bar
//
//  Created by Ben Selby on 02/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var preferencesWindowController: NSWindowController!
    var resultsWindowController: NSWindowController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.preferencesWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "preferences window") as? NSWindowController

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    /**
     Load the preferences window into the foreground
     */
    func showPreferencesWindow() {
        NSApplication.shared().activate(ignoringOtherApps: true)
        self.preferencesWindowController.showWindow(nil)
    }

    func showResultsWindow() {
        let preferences = AppPreferences()
        self.resultsWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "results window") as? NSWindowController
        NSApplication.shared().activate(ignoringOtherApps: true)
        self.resultsWindowController.showWindow(nil)
        self.resultsWindowController.window?.titleVisibility = .hidden
        self.resultsWindowController.window?.titlebarAppearsTransparent = true
        self.resultsWindowController.window?.appearance = NSAppearance(named: preferences.getNsAppearanceName())
        self.resultsWindowController.window?.isMovableByWindowBackground = true
    }
}

