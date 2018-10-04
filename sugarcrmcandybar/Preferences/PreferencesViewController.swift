//
//  PreferencesViewController.swift
//  SugarCRM Candy Bar
//
//  Created by Ben Selby on 02/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {

    @IBOutlet weak var urlField: NSTextField!
    @IBOutlet weak var usernameField: NSTextField!
    @IBOutlet weak var passwordField: NSSecureTextField!
    @IBOutlet weak var appIcon: NSImageView!
    @IBOutlet weak var errorLabel: NSTextField!
    @IBOutlet weak var indicator: NSProgressIndicator!
    @IBOutlet weak var appearance: NSPopUpButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let instance = SugarCrmInstance()
        self.urlField.stringValue = instance.getUrl()
        self.usernameField.stringValue = instance.getUsername()
        self.passwordField.stringValue = instance.getPassword()
        
        let icon = NSImage(named: "AppIcon");
        appIcon.image = icon
    }

    override func keyUp(with event: NSEvent) {
        if (event.keyCode == 36) {
            self.savePreferences()
        } else {
            super.keyUp(with: event)
        }
    }

    // MARK: - Actions
    @IBAction func saveClicked(_ sender: NSButton) {
        self.savePreferences()
    }

    func savePreferences() {
        errorLabel.isHidden = true
        indicator.isHidden = false
        indicator.startAnimation(nil)

        let instance = SugarCrmInstance()
        instance.setUrl(url: urlField.stringValue)
        instance.setUsername(username: usernameField.stringValue)
        instance.setPassword(password: passwordField.stringValue)

        let sugarClient = SugarCrmClient(instance: instance)
        let request = RequestGetMe(crmInstance: instance)
        sugarClient.makeRequest(clientRequest: request) { data in
            let response = data as! Response

            DispatchQueue.main.async {
                self.indicator.startAnimation(nil)
                self.indicator.isHidden = true
                if (response.wasSuccessful()) {
                    self.view.window?.orderOut(self)
                } else {
                    self.errorLabel.isHidden = false
                }
            }
        }
    }
}
