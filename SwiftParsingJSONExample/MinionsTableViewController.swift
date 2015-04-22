//
//  MinionsTableViewController.swift
//  SwiftParsingJSONExample
//
//  Created by Natasha Murashev on 7/16/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class MinionsTableViewController: UITableViewController {

    let minions: [Minion]
    
    required init(coder aDecoder: NSCoder!) {
        
        minions = Minion.fetchMinionData()
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return minions.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("minionCell", forIndexPath: indexPath) as! UITableViewCell

        let minion = minions[indexPath.row]
        
        cell.imageView?.image = UIImage(named: minion.name ?? "Dave")
        cell.textLabel?.text = minion.name ?? "Minion"

        if let loves = minion.loves {
            cell.detailTextLabel?.text = "Loves \(loves.lowercaseString)"
        } else {
            cell.detailTextLabel?.text = "Loves everything under the sun"
        }

        return cell
    }

}
