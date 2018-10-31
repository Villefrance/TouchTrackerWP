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
            if let linesToSet = newValue?.lines {
                drawView.finishedLines = linesToSet
            }
        }
    }

    @IBAction func save(_ sender: UIBarButtonItem) {
        if let json = drawing?.json {
            if let url = try? FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true
            ).appendingPathComponent("Untitled.json") {
                do {
                    try json.write(to: url)
                    print("saved succesfully!")
                } catch let error {
                    print("Couldn't save \(error)")
                }
            }
    
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let url = try? FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        ).appendingPathComponent("Untitled.json") {
            if let jsonData = try? Data(contentsOf: url) {
                print("read data succesfully")
                drawing = Drawing(json: jsonData)
                // drawView.setNeedsDisplay()
            }
        }
    }
    
    
}

