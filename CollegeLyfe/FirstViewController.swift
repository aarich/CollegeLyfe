//
//  FirstViewController.swift
//  CollegeLyfe
//
//  Created by Alex Rich on 11/14/14.
//  Copyright (c) 2014 Alex Rich and Jessica Szejer. All rights reserved.
//

// change

// hi

import UIKit

class FirstViewController: UIViewController {
    
    var startTime = NSTimeInterval()
    var currentTime = NSDate.timeIntervalSinceReferenceDate()
    var finish = NSDate.dateByAddingTimeInterval(currentTime)
    

    @IBOutlet weak var percent1: UITextField!
    @IBOutlet weak var finishtime1: UITextField!
    @IBOutlet weak var inputtime1: UITextField!
    @IBOutlet weak var progressbar1: UIProgressView!
    
    @IBOutlet weak var inputtime2: UITextField!
    @IBOutlet weak var finishtime2: UITextField!
    @IBOutlet weak var progressbar2: UIProgressView!
    @IBOutlet weak var percent2: UITextField!
    
    @IBOutlet weak var inputtime3: UITextField!
    @IBOutlet weak var finishtime3: UITextField!
    @IBOutlet weak var progressbar3: UIProgressView!
    @IBOutlet weak var percent3: UITextField!
    
    @IBOutlet weak var inputtime4: UITextField!
    @IBOutlet weak var finishtime4: UITextField!
    @IBOutlet weak var percent4: UITextField!
    @IBOutlet weak var progressbar4: UIProgressView!
    
    
    func updateTime() {
        
        
        //Find the difference between current time and start time.
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strMinutes = minutes > 9 ? String(minutes): "0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds): "0" + String(seconds)
        
        
        var timePassedString = "\(strMinutes):\(strSeconds)"
        
        var timePassed = Float(elapsedTime/60)
        var time1 = Float(inputtime1)
        
        progressbar1.progress = timePassed/time1
        percent1.text = String(100*progressbar1.progress)
        
        finishtime1 = realworldtime + inputtime1
        
        if percent1.text == "100" {
            //set off alarm
            refreshUI()
        }
                
        
    }
    
    var timer = NSTimer()
    
    
    @IBAction func go1(sender: AnyObject) {
        let aSelector : Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
    }
    @IBAction func stop1(sender: AnyObject) {
        timer.invalidate()
        timer == 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

