//
//  ViewController.swift
//  new
//
//  Created by Артем Тюменцев on 28.09.17.
//  Copyright © 2017 Артем Тюменцев. All rights reserved.

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
        case koren
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
        case .koren: if a1 < 0 && abs(remainder(a2, 2)) == 1 {return -pow(-a1, 1 / a2)} else {return pow(a1, 1 / a2)}
        }
    }
    @IBAction func zhmiknopky (sender:NSButton) {
        if matdey == nil && TitleOutlet.stringValue != "" {
            arg1 = Double(TitleOutlet.stringValue)!
            if String (arg1).suffix(2) == ".0" {TitleOutlet.placeholderString = String (String (arg1).dropLast(2))}
            else {TitleOutlet.placeholderString = String (arg1)}
            TitleOutlet.stringValue = ""
        }
        else if TitleOutlet.stringValue != "" {
            arg2 = Double(TitleOutlet.stringValue)!
            ravno = raschet(a1: arg1, d: matdey!, a2: arg2)
            if String (ravno).suffix(2) == ".0" {TitleOutlet.stringValue = String (String (ravno).dropLast(2))}
            else {TitleOutlet.stringValue = String (ravno)}
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
        else if sender.title == "√" {
            matdey = .koren
        }
        else {
            matdey = nil
        }
    }
    @IBAction func procent (sender:NSButton) {
        
    }
    
    @IBAction func plusminus (sender:NSButton) {
        if TitleOutlet.stringValue.prefix(1) == "-" {
            TitleOutlet.stringValue = String (TitleOutlet.stringValue.dropFirst(1))
        } else {
            TitleOutlet.stringValue = "-"+(TitleOutlet.stringValue)
        }
    }
    
    @IBAction func cl (sender:NSButton) {
        arg1 = 0
        arg2 = 0
        matdey = nil
        TitleOutlet.stringValue = ""
        TitleOutlet.placeholderString = "0"
    }
}
