//
//  ViewController.swift
//  new
//
//  Created by Артем Тюменцев on 28.09.17.
//  Copyright © 2017 Артем Тюменцев. All rights reserved.
// я тут был

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
    var arg1 = 0.0, arg2 = 0.0, ravno = 0.0
    var matdey:oper?
    enum oper {
        case plus
        case minus
        case umn
        case del
        case stepen
    }
    
    @IBOutlet weak var TitleOutlet: NSTextField!

    @IBAction func buttnpers (sender:NSButton) {
        TitleOutlet.stringValue += sender.title
    }
    func raschet (a1:Double, d:oper, a2:Double) -> Double {
        switch d {
        case .plus: return a1 + a2
        case .minus: return a1 - a2
        case .umn: return a1 * a2
        case .del: return a1 / a2
        case .stepen: return pow(a1, a2)
        }
    }
    @IBAction func zhmiknopky (sender:NSButton) {
        if matdey == nil {arg1 = Double(TitleOutlet.stringValue)!
            TitleOutlet.placeholderString = String(arg1)
            TitleOutlet.stringValue = ""
        }
        else if TitleOutlet.stringValue != "" {arg2 = Double(TitleOutlet.stringValue)!
            TitleOutlet.stringValue = String (raschet(a1: arg1, d: matdey!, a2: arg2))
            TitleOutlet.placeholderString = TitleOutlet.stringValue
            arg1 = Double(TitleOutlet.stringValue)!
            TitleOutlet.stringValue = ""
        }
        if sender.title == "+" {
            matdey = .plus
        }
        else if sender.title == "-" {
            matdey = .minus
        }
        else if sender.title == "*" {
            matdey = .umn
        }
        else if sender.title == "/" {
            matdey = .del
        }
        else if sender.title == "x²" {
            matdey = .stepen
        }
    }
    @IBAction func procent (sender:NSButton) {
        
    }
    @IBAction func cl (sender:NSButton) {
        arg1 = 0
        arg2 = 0
        matdey = nil
        TitleOutlet.stringValue = ""
        TitleOutlet.placeholderString = "0"
    }
}
