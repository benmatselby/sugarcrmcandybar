//
//  ResultsViewController.swift
//  SugarCRM Candy Bar
//
//  Created by Ben Selby on 03/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Cocoa

class ResultsViewController: NSViewController {

    @IBOutlet weak var searchField: NSSearchFieldCell!
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var indicator: NSProgressIndicator!
    @IBOutlet weak var resultsLabel: NSTextField!
    @IBOutlet weak var explanationLabel: NSTextField!
    @IBOutlet var searchModuleMenu: NSMenu!

    var crmRecords: [RecordBase] = []
    var moduleSelected: String = ""

    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.appearance = NSAppearance(named: NSAppearanceNameAqua)
        self.tableView.isHidden = true
    }

    /// Override the keydown behaviour for the view controller
    /// Check if there is a selected row
    ///
    /// - Parameter event: The key down event
    override func keyDown(with event: NSEvent) {
        if (event.keyCode == 36 && self.tableView.selectedRow != -1) {
            self.loadRecord()
        } else {
            super.keyDown(with: event)
        }
    }

    // MARK: - Actions
    @IBAction func closeClicked(_ sender: NSButton) {
        crmRecords = []
        view.window?.orderOut(self)
    }

    @IBAction func searchRequest(_ sender: NSSearchFieldCell) {
        if sender.stringValue != "" {
            resultsLabel.isHidden = true
            indicator.isHidden = false
            indicator.startAnimation(sender)
            let sugarInstance = SugarCrmInstance()
            let sugarClient = SugarCrmClient(instance: sugarInstance)
            let request = RequestGlobalSearch(crmInstance: sugarInstance, searchQuery: sender.stringValue)
            request.setModule(module: self.moduleSelected)
            sugarClient.makeRequest(clientRequest: request) { data in
                let response = data as! Response

                DispatchQueue.main.async {
                    self.indicator.isHidden = true
                }

                if (!response.wasSuccessful()) {
                    DispatchQueue.main.async {
                        self.resultsLabel.isHidden = false
                        self.resultsLabel.stringValue = "Authentication issue, please update your credentials"
                    }
                    return
                }

                let searchResponse = data as! ResponseGlobalSearch
                DispatchQueue.main.async {
                    self.crmRecords = searchResponse.getRecords()

                    if (self.crmRecords.count == 0) {
                        self.resultsLabel.isHidden = false
                        self.resultsLabel.stringValue = "No matching records found"
                    } else {
                        self.view.window?.makeFirstResponder(self.tableView)
                        self.tableView.isHidden = false
                        self.explanationLabel.isHidden = true
                        self.tableView.reloadData()
                        self.tableView.selectRowIndexes(IndexSet(integer: 0), byExtendingSelection: true)
                    }
                }
            }
        }
    }

    /// User has clicked a record in the table
    ///
    /// - Parameter sender: The table view
    @IBAction func singleClick(_ sender: NSTableView) {
        self.loadRecord()
    }

    /// Set which module we want to limit the search to
    @IBAction func moduleClicked(_ sender: NSMenuItem) {
        let module = sender.title
        let items = self.searchField.searchMenuTemplate?.items
        for item in items! {
            if (item.title == module) {
                if (item.state == 0) {
                    item.state = NSOnState
                    sender.state = NSOnState
                    self.moduleSelected = module
                } else {
                    item.state = NSOffState
                    sender.state = NSOffState
                    self.moduleSelected = ""
                }
            } else {
                item.state = NSOffState
            }
        }
    }

    // MARK: - Functions

    /// Load the record in the system browser
    func loadRecord() {
        if (crmRecords.count == 0) {
            return
        }
        let record = crmRecords[self.tableView.selectedRow]
        let segment = record.getUrl()
        let sugarInstance: SugarCrmInstance = SugarCrmInstance()
        NSWorkspace.shared().open(URL(string: sugarInstance.getUrl()+segment)!)
        self.view.window?.orderOut(self)
    }
}

// MARK: - Table View DataSource
extension ResultsViewController : NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.crmRecords.count
    }
}

// MARK: - Table View Delegate
extension ResultsViewController : NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        let record = self.crmRecords[row]
        if tableColumn == tableView.tableColumns[0] {
            let cell = tableView.make(withIdentifier: "moduleCellID", owner: nil) as? SugarCrmModuleTableCell
            cell?.setModule(module: record.getModuleIconText())
            return cell
        } else {
            let cell = tableView.make(withIdentifier: "nameCellID", owner: nil) as? NSTableCellView
            cell?.textField?.stringValue = record.getName()
            return cell
        }
    }
}
