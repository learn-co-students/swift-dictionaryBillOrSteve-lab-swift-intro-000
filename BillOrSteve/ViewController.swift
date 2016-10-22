//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var Steve: UILabel!
    @IBOutlet weak var Bill: UILabel!
    
    @IBAction func steveBtn(_ sender: UIButton) {
        showFact()
        if correctPerson == "Steve Jobs" {
            score.text = String(score.tag)
            score.tag += 1
        }
    }
    
    @IBAction func billBtn(_ sender: UIButton) {
        showFact()
        if correctPerson == "Bill Gates" {
            score.text = String(score.tag)
            score.tag += 1
        }
    }
    
    
    // Create your stored properties here
    var billAndSteveFacts: [String : [String]] = [:]
    var correctPerson: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
    }
    
    func createFacts() {
        
        let billFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish."]
        
        let steveFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.", "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        
        
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
        
        // implement your function here
        for (_, value) in billAndSteveFacts {
            if randomPerson() == "Bill Gates" {
                let random = randomIndex(fromArray: value)
                return ("Bill Gates", "\(value[random])")
            } else if randomPerson() == "Steve Jobs" {
                let random = randomIndex(fromArray: value)
                return ("Steve Jobs", "\(value[random])")
            }
            
        }
        return ("","")
    }
    
    func showFact(){
        factLabel.text = getRandomFact().1
        correctPerson = getRandomFact().0
        
    }
    
    

    
}
