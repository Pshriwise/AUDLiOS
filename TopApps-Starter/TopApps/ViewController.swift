//
//  ViewController.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/1/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet
    var tableView: UITableView!

    var items: [String] = ["hot","hot","mama"]
    
    var num_rows = 0
    
    var json:JSON = JSON.Null(nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Get the #1 app name from iTunes and SwiftyJSON
        DataManager.getUrlDataWithSuccess { (Data) -> Void in
            let json = JSON(data: Data)
            for i in 0...9 {
            if let TeamName = json[i][0].stringValue {
                if let TeamID = json[i][1].stringValue {
                println("Team \(i): \(TeamName) \(TeamID)")
                }
            }
        }
            
        // More soon...
        }
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell

        DataManager.getUrlDataWithSuccess { (Data) -> Void in
            let json = JSON(data: Data)
            println(json[indexPath.row])
            println(indexPath.row)
            cell.textLabel?.text = json[indexPath.row][0].stringValue
            
        }
    
//        cell.textLabel?.text = self.items[indexPath.row]//[0].stringValue
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}