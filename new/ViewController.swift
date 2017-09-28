//
//  ViewController.swift
//  new
//
//  Created by Артем Тюменцев on 28.09.17.
//  Copyright © 2017 Артем Тюменцев. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBOutlet weak var BtnCEoutlet: NSButton!
    @IBAction func btnActionCE(_ sender: NSButton) {
    }
    
    @IBOutlet weak var BtnOutlet1: NSButton!
    @IBAction func BtnAction1(_ sender: NSButton) {
    }
    
    @IBOutlet weak var BtnOutlet2: NSButton!
    @IBAction func BtnAction2(_ sender: NSButton) {
    }
    
    @IBOutlet weak var BtnOutlet3: NSButton!
    @IBAction func BtnAction3(_ sender: NSButton) {
    }
    
    
    
}

