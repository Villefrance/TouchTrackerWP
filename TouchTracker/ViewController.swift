//
//  ViewController.swift
//  TouchTracker
//
//  Created by Jacob Nielsen on 24/10/2017.
//  Copyright © 2017 Jacob Nielsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet var drawView: DrawView!
    
    // MARK: - Model
    
    var drawing: Drawing? {
        get {
            return Drawing(lines: drawView.finishedLines)
        } set {
            
        }
    }

    @IBAction func save(_ sender: UIBarButtonItem) {
        if let json = drawing?.json {
            if let jsonString = String(data: json, encoding: .utf8) {
                print(jsonString)
            }
        }
    }
    
    
    
}

