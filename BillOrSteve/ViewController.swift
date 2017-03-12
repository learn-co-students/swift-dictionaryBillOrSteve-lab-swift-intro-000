//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var facts: [String: [String]] = [:]
    var correctPerson = ""
    var score = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    @IBAction func steveButtonPressed(_ sender: Any) {
        if correctPerson == "Steve Jobs" {
            score += 1
        } else {
            score -= 1
        }
        
        showFact()
    }
    
    @IBAction func billButtonPressed(_ sender: Any) {
        if correctPerson == "Bill Gates" {
            score += 1
        } else {
            score -= 1
        }
        
        showFact()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
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
    
    func createFacts() {
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends moreo n global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo",
            "He was a pescetarian, meaning he ate no meat except for fish"
        ]
        
        facts["Bill Gates"] = billFacts
        facts["Steve Jobs"] = steveFacts
    }
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        if let facts = facts[person] {
            let index = randomIndex(fromArray: facts)
            return (person, facts[index])
            
        }
        
        return ("error", "error")
    }
    
    func showFact() {
        let randomFact = getRandomFact()
        let person = randomFact.0
        let fact = randomFact.1
    
        factLabel.text = fact
        correctPerson = person
    }
}















































































