//
//  SecondViewController.swift
//  CollegeLyfe
//
//  Created by Alex Rich on 11/14/14.
//  Copyright (c) 2014 Alex Rich and Jessica Szejer. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var willingToSpend: UITextField!
    @IBOutlet weak var addedItem: UITextField!
    @IBOutlet weak var priceOfItem: UITextField!
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var CalculateOptionsButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    @IBOutlet weak var ItemTable: UITableView!
    @IBOutlet weak var OptionTable: UITableView!
    @IBOutlet var TapRec: UITapGestureRecognizer!
    @IBOutlet weak var NextButton: UIButton!
    
    let groc = Grocery()
    var current = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ItemTable.dataSource = self
        ItemTable.delegate = self
        OptionTable.dataSource = self
        OptionTable.delegate = self
        refreshUI()
    }
    
    func refreshUI() {
        ItemTable.reloadData()
        OptionTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == ItemTable {
            if (!groc.items.isEmpty) {
                return groc.items.count
            }
            return 1
        }
        if (!groc.possibleCombos.isEmpty) {
            return groc.possibleCombos[current].count
        }
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell {
        let r = indexPath.row
        var cell = UITableViewCell()
        var label = UILabel(frame: CGRect(x:5, y:0, width:200, height:50))
        if tableView == ItemTable {
            if groc.items.isEmpty {
                label.text = "Add an item!"
            } else {
                label.text = "\(groc.items[r].name) (\(groc.items[r].value))"
            }
        } else {
            if groc.possibleCombos.isEmpty {
                label.text = "Press Calculate"
            }
            else {
                let tuple = groc.possibleCombos[current][r]
                label.text = "Get \(tuple.value) of \(tuple.name)"
            }
        }
        cell.addSubview(label)
        return cell
    }
    
    
    // UITableViewDelegate Functions
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    @IBAction func ResetAll(sender : AnyObject) {
        groc.reset()
        willingToSpend.text = ""
        addedItem.text = ""
        priceOfItem.text = ""
        refreshUI()
    }
    
    @IBAction func AddItem(sender: AnyObject) {
        groc.addItem(addedItem.text, val: Double(priceOfItem.text.toInt()!))
        addedItem.text = ""
        priceOfItem.text = ""
        refreshUI()
    }
    
    @IBAction func ComputeOptions(sender: AnyObject) {
        groc.setSpendingLimit(Double(willingToSpend.text.toInt()!))
        groc.compute()
        refreshUI()
    }
    
    @IBAction func Next(sender: AnyObject) {
        current++
        if current > groc.possibleCombos.count - 1 {
            current = 0
        }
        refreshUI()
    }
    
    @IBAction func viewTapped(sender : AnyObject) {
//        willingToSpend.resignFirstResponder()
//        addedItem.resignFirstResponder()
//        priceOfItem.resignFirstResponder()
    }


}