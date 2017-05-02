//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var factlabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var askButton: UIButton!
    
    
    var billAndSteveFacts: [String : [String]] = [:]
    var factPerson = ""
    var questionsAsked = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askButton.isHidden = true
        createFacts()
        displayRandomFact(fact: getRandomFact())
    }
    
    func createFacts() {
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    func getRandomFact() -> (String, String) {
        let factPerson = randomPerson()
        var randomFact = ""
        if let personFacts = billAndSteveFacts[factPerson] {
            let indexOfFact = randomIndex(fromArray: personFacts)
            randomFact = personFacts[indexOfFact]
            billAndSteveFacts[factPerson]?.remove(at: indexOfFact)
        }
        
        questionsAsked += 1
        
        return (randomFact, factPerson)
    }
    
    func displayRandomFact(fact: (question: String, answer: String)) {
        factlabel.text = fact.question
        factPerson = fact.answer
        askButton.isHidden = true
    }
    
    @IBAction func steveButton(_ sender: Any) {
        if factPerson == "Steve Jobs" {
            score += 1
            scoreLabel.text = String(score)
            
            if questionsAsked < 5 {
                factlabel.text = "Correct!"
                askButton.isHidden = false
            } else {
                factlabel.text = "Correct! You got \(score) out of 5 correct."
            }
        } else {
            if questionsAsked < 5 {
                factlabel.text = "Wrong!"
                askButton.isHidden = false
            } else {
                factlabel.text = "Wrong! You got \(score) out of 5 correct."
            }
            
        }
    }
    
    @IBAction func billButton(_ sender: Any) {
        if factPerson == "Bill Gates" {
            score += 1
            scoreLabel.text = String(score)
            
            if questionsAsked < 5 {
                factlabel.text = "Correct!"
                askButton.isHidden = false
            } else {
                factlabel.text = "Correct! You got \(score) out of 5 correct."
            }
        } else {
            if questionsAsked < 5 {
                factlabel.text = "Wrong!"
                askButton.isHidden = false
            } else {
                factlabel.text = "Wrong! You got \(score) out of 5 correct."
            }
        }
    }
    
    
    @IBAction func askButton(_ sender: Any) {
        displayRandomFact(fact: getRandomFact())
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
    
}
