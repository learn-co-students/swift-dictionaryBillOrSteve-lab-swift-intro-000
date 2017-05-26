//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    @IBAction func steveButtonAction(_ sender: Any) {
        if correctPerson == "Steve Jobs" {
            currentScore += 1
            score.text = "\(currentScore)"
        }
        showFact()
    }
    
    @IBAction func billButtonAction(_ sender: Any) {
        if correctPerson == "Bill Gates" {
            currentScore += 1
            score.text = "\(currentScore)"
        }
        showFact()
    }
    
    // Create your stored properties here
    var correctPerson = ""
    var billAndSteveFacts: [String : [String]] = [:]
    var currentScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    func showFact() {
        let (person, fact) = getRandomFact()
        correctPerson = person
        factLabel.text = fact
        
    }
    
    func getRandomFact() -> (String, String) {
        
        let person = randomPerson()
        let fact = billAndSteveFacts[person]!
        let index = randomIndex(fromArray: fact)
        let question = fact[index]
        
        return (person, question)
        
    }
    
    func createFacts() {
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionare at 31.",
            "He scored 1590 (out of 1600) on his SAT's.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and lept over the chair like a boss."
        ]
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in his future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly the Space Shuttle as a civillian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
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
