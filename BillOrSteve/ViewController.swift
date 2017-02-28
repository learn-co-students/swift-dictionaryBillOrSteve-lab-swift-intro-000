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
    var steve = "Steve Jobs"
    var bill = "Bill Gates"
    var billAndSteveFacts:[String:[String]] = [:]
    var correctPerson = ""
    var totalFacts = 0
    var correctCount = 0
    var guessCount = 0
    var currentRandomIndex = 0
    @IBOutlet var factLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var steveLabel: UILabel!
    @IBOutlet var steveButton: UIButton!
    @IBOutlet var billLabel: UILabel!
    @IBOutlet var billButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        
        for facts in billAndSteveFacts {
            totalFacts += facts.value.count
        }
        
        updateScore()
        showFact()
    }
    
    func updateScore() {
        scoreLabel.text = "\(correctCount)/\(totalFacts)"
    }
    
    func createFacts() {
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                         "He scored 1590 (out of 1600) on his SATs.",
                         "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                         "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                         "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                          "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                          "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                          "He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveFacts[bill] = billFacts
        billAndSteveFacts[steve] = steveFacts
    }
    
    func getRandomFact() -> (person: String, fact: String) {
        var output = ("","")
        let person = randomPerson()
        if let facts = billAndSteveFacts[person] {
            if facts.count > 0 {
                currentRandomIndex = randomIndex(fromArray: facts)
                let fact = facts[currentRandomIndex]
                output = (person, fact)
            }
        }
        
        return output
    }
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        if array.count > 1 {
            return Int(arc4random_uniform(UInt32(array.count - 1)))
        }
        
        return 0
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            if let facts = billAndSteveFacts[steve] {
                if facts.count > 0 {
                    return steve
                }
            }
            return bill
        } else {
            if let facts = billAndSteveFacts[bill] {
                if facts.count > 0 {
                    return bill
                }
            }
            return steve
        }
    }
    
    func showFact() {
        let (person,fact) = getRandomFact()
        correctPerson = person
        factLabel.text = fact
    }
    
    func deleteFact(person: String) {
        if let facts = billAndSteveFacts[person] {
            var newFacts = facts
            if newFacts.count >= currentRandomIndex + 1 {
                newFacts.remove(at: currentRandomIndex)
                billAndSteveFacts.updateValue(newFacts, forKey: person)
            }
        }
    }
    
    @IBAction func chosenButton(_ sender: UIButton) {
        let chosenNameOp = sender.currentTitle
        if let chosenName = chosenNameOp {
            if chosenName == correctPerson {
                correctCount += 1
            }
            deleteFact(person: correctPerson)
        }
        updateScore()
        guessCount += 1
        if guessCount < totalFacts {
            showFact()
        } else {
            factLabel.text = "Test finished. \nThank you."
            steveLabel.isHidden = true
            steveButton.isHidden = true
            billLabel.isHidden = true
            billButton.isHidden = true
        }
    }
}
