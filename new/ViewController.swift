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
    var stroka:String = ""
    var matdey:oper?
    enum oper {
        case plus
        case minus
        case umn
        case del
        case stepen
        case koren
        case procent
    }
    @IBOutlet weak var TitleOutlet: NSTextField!
    @IBOutlet weak var LabelOutlet: NSTextField!
    @IBAction func buttnpers (sender:NSButton) {
        stroka += sender.title
        TitleOutlet.stringValue = stroka
        
    }
    func raschet (a1:Double, d:oper, a2:Double) -> Double {
        switch d {
        case .plus: return a1 + a2
        case .minus: return a1 - a2
        case .umn: return a1 * a2
        case .del: return a1 / a2
        case .stepen: return pow(a1, a2)
        case .koren: if a1 < 0 && abs(remainder(a2, 2)) == 1 {return -pow(-a1, 1 / a2)} else {return pow(a1, 1 / a2)}
        case .procent: return (a1/100)*a2
        }
    }
    @IBAction func zhmiknopky (sender:NSButton) {
        if matdey == nil && stroka != "" {
            arg1 = Double(stroka)!
            if String (arg1).suffix(2) == ".0" {TitleOutlet.stringValue = String (String (arg1).dropLast(2))}
            else {TitleOutlet.stringValue = String (arg1)}
            stroka = ""
        }
        else if stroka != "" {
            arg2 = Double(stroka)!
            ravno = raschet(a1: arg1, d: matdey!, a2: arg2)
            if String (ravno).suffix(2) == ".0" {stroka = String (String (ravno).dropLast(2))}
            else {stroka = String (ravno)}
            TitleOutlet.stringValue = stroka
            arg1 = Double(stroka)!
            stroka = ""
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
        else if sender.title == "𝑥ʸ" {
            matdey = .stepen
        }
        else if sender.title == "ʸ√𝑥" {
            matdey = .koren
        }
        else if sender.title == "%" {
            matdey = .procent
        }
        else {
            matdey = nil
        }
    }
    @IBAction func tochka (sender:NSButton) {
        if !TitleOutlet.stringValue.contains(".") {
            if TitleOutlet.stringValue != "" {
                TitleOutlet.stringValue += sender.title
            }
            else {
                TitleOutlet.stringValue = "0"+sender.title
            }
        }
      stroka = TitleOutlet.stringValue
    }
    
    @IBAction func plusminus (sender:NSButton) {
        if TitleOutlet.stringValue.prefix(1) == "-" {
            TitleOutlet.stringValue = String (TitleOutlet.stringValue.dropFirst(1))
        } else {
            TitleOutlet.stringValue = "-"+(TitleOutlet.stringValue)
        }
        stroka = TitleOutlet.stringValue
    }
    
    @IBAction func cl (sender:NSButton) {
        arg1 = 0
        arg2 = 0
        matdey = nil
        stroka = ""
        TitleOutlet.stringValue = "0"
    }
    var key = false
    var save = ""
    @IBAction func save(sender:NSButton) {
        if key == false {
            save = TitleOutlet.stringValue
            LabelOutlet.stringValue = "Число в памяти: " + save
            key = true
        }
        else {
            stroka = save
            TitleOutlet.stringValue = stroka
        }
        
    }
    
}
