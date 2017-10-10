//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //labels
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var result: UILabel!
    
    
    var answer1 = ""
    
    
    
    // Create your stored properties here
    var dict1: [String:[String]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
    }
    
    func createFacts()
    {
        let billFacts:[String] = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization."]
        
        let steveFacts:[String] = ["He was a pescetarian, meaning he ate no meat except for fish.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font."]
        
        dict1["Bill Gates"] = billFacts
        dict1["Steve Jobs"] = steveFacts
    }
    
    func getRandomFact() -> (String, String)
    {
        var a = randomPerson()
        var b = dict1[a] //facts
        if var b = b
        {
            var c = randomIndex(fromArray: b) //random fact
            return (a, b[c]) //returns random person w/ random fact about them
        }
        else
        {
            return ("error","error")
        }
        
        
    }
    
    @IBAction func start1(_ sender: UIButton)
    {
        var work1 = getRandomFact()
        
        question1.text = work1.1
        answer1 = work1.0
 
    }
    
    @IBAction func steve(_ sender: UIButton) {
        let userAnswer = "Steve Jobs"
        
        if userAnswer == answer1
        {
            result.text = "Correct"
        }
        else
        {
            result.text = "Wrong. Try Again"
        }
    }
    
    @IBAction func bill(_ sender: UIButton) {
        let userAnswer = "Bill Gates"
        
        if userAnswer == answer1
        {
            result.text = "Correct"
        }
        else
        {
            result.text = "Wrong. Try Again"
        }
    }
    
    
    
        
    
    
    
    
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2) //random number 0-1
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
}
