//
//  ViewController.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/1/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//

import UIKit


class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the #1 app name from iTunes and SwiftyJSON
        DataManager.getUrlDataWithSuccess { (iTunesData) -> Void in
            let json = JSON(data: iTunesData)
            for i in 0...9 {
            if let TeamName = json[i][0].stringValue {
                if let TeamID = json[i][1].stringValue {
                println("Team \(i): \(TeamName) \(TeamID)")
             }
            }
            }
            // More soon...
        }
}

}