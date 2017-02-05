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
    var steveJobs = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
        "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
        "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
        "He was a pescetarian, meaning he ate no meat except for fish."]
    var billGates = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
        "He scored 1590 (out of 1600) on his SATs.",
        "His foundation spends more on global health each year than the United Nation's World Health Organization.",
        "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
        "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
    
    lazy var factsDict:[String:[String]] = ["Steve Jobs":self.steveJobs, "Bill Gates":self.billGates]
  
    
    var correctAns = 0
    var qs:[String] = []
    var idx: Int = 0
    var person: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDisplay()
    }
    
    func updateDisplay() {
        score.text = "\(correctAns)/\(steveJobs.count+billGates.count)"
        
        person = randomPerson()    //find person
        qs = factsDict[person]!     //get all questions
        idx = randomIndex(fromArray: qs)    //choose random q
        question.text = qs[idx]
        
        //reset correctAns
        if correctAns == (steveJobs.count+billGates.count) {
            correctAns = 0
        }
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
    
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var question: UILabel!
    
    @IBAction func steveButton(_ sender: AnyObject) {
        if person == "Steve Jobs"{
           correctAns += 1
           updateDisplay()
        }
        else {
            //question.text = "Wrong answer. Try again."
            //sleep(5)
            updateDisplay()
            
        }
    }
    
    @IBAction func billButton(_ sender: AnyObject) {
        if person == "Bill Gates" {
            correctAns += 1
            updateDisplay()
        }
        else {
            //question.text = "Wrong answer. Try again."
            //sleep(5)
            updateDisplay()
            
        }
    }
    
    
}
