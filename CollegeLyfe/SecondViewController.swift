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
    
    let groc = Grocery()
    
    override func viewDidLoad() {
        groc.addItem("bob", val: 5)

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        outputTable.datasource = self
//        outputTable.delegate = self
        refreshUI()
    }
    
    func refreshUI() {
        groc.addItem("alex", val: 3)
        ItemTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == ItemTable {
            return 1//groc.items.count
        }
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell {
        let r = indexPath.row
        let cell = UITableViewCell()
        let label = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        if tableView == ItemTable {
//            label.text = "\(groc.items[r].name) (\(groc.items[r].name))"
            label.text = "HEHE"
        } else {
            label.text = "blah"
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
        groc.compute()
        refreshUI()
    }
    
    @IBAction func viewTapped(sender : AnyObject) {
//        willingToSpend.resignFirstResponder()
//        addedItem.resignFirstResponder()
//        priceOfItem.resignFirstResponder()
    }


}