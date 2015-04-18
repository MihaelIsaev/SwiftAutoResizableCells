//
//  ViewController.swift
//  AutoResizableCells
//
//  Created by mihael on 18/04/15.
//  Copyright (c) 2015 Mihael Isaev inc. All rights reserved.
//

import UIKit

struct MyRow {
    var topText: String!
    var middleText: String!
    var bottomText: String!
}

class TableViewController: UITableViewController {

    var rows:[MyRow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        rows.append(MyRow(topText: "Lorem\nipsum\ndolor", middleText: "Lorem\nipsum\ndolor", bottomText: "Lorem\nipsum\ndolor"))
        rows.append(MyRow(topText: "I've\ngot\nresizable cells", middleText: "I've\ngot\nresizable cells", bottomText: "I've\ngot\nresizable cells"))
        rows.append(MyRow(topText: "Lorem\nipsum\ndolor", middleText: "Lorem\nipsum\ndolor", bottomText: "Lorem\nipsum\ndolor"))
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomResizableCell
        cell.topLabel.text = rows[indexPath.row].topText
        cell.middleLabel.text = rows[indexPath.row].middleText
        cell.bottomLabel.text = rows[indexPath.row].bottomText
        return cell
    }
}

class CustomResizableCell: UITableViewCell {
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
}
