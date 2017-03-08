//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create your stored properties here
    var billAndSteveFacts: [String : [String]] = [:]
    var correctPerson:String = ""
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var ansCounter: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }

    @IBAction func billClicked(_ sender: AnyObject) {
        
        if correctPerson == "Bill Gates" {
            if let currentCount = ansCounter.text {
                ansCounter.text = String(Int(currentCount)! + 1)
            }else {
                ansCounter.text = "0"
            }
            
        }
        
        showFact()
        
    }
    
    @IBAction func steveClicked(_ sender: AnyObject) {
        
        if correctPerson == "Steve Jobs" {
            if let currentCount = ansCounter.text {
                ansCounter.text = String(Int(currentCount)! + 1)
            }else {
                ansCounter.text = "0"
            }
            
        }
        
        showFact()
        
    }
    
    
    func showFact(){
       let thisFact = getRandomFact()
       correctPerson = thisFact.0
       let fact = thisFact.1
       factLabel.text = fact
    }
    
    func createFacts() {
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]

        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    func getRandomFact() -> (String, String) {
        
           let rPerson = randomPerson()
        let rFact:String
        let rIndex:Int
        if let myFact = billAndSteveFacts[rPerson]{
           
            rIndex = randomIndex(fromArray:myFact)
            rFact = myFact[rIndex]
            return (rPerson,rFact)
        }else {
        
            return("false","No Item")
        
        }
       
        
      
        
    }
    
    
    
    
    
}
