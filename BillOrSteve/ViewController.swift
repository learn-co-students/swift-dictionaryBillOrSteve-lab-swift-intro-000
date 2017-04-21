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
    var steveAndBillFacts: [String:[String]] = [:]
    var correctPerson: String = ""
    var randomFacts: [(person: String, fact: String)] = []
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        fillRandomFacts()
        showFact()
        restartButton.isHidden = true
    }
    
    
    
    func createFacts() {
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                          "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                          "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                          "He was a pescetarian, meaning he ate no meat except for fish."]
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                         "He scored 1590 (out of 1600) on his SATs.",
                         "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                         "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                         "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        steveAndBillFacts["Steve Jobs"] = steveFacts
        steveAndBillFacts["Bill Gates"] = billFacts
        
    }
    
    func getRandomFact() -> (person: String,fact: String) {
        var person = ""
        
        if (steveAndBillFacts["Steve Jobs"]?.isEmpty)! && (steveAndBillFacts["Bill Gates"]?.isEmpty)! {
            
        } else if (steveAndBillFacts["Steve Jobs"]?.isEmpty)! {
            person = "Bill Gates"
        } else if (steveAndBillFacts["Bill Gates"]?.isEmpty)! {
            person = "Steve Jobs"
        } else {
            person = randomPerson()
            
        }
        
        let personFacts = steveAndBillFacts[person]
        if var personFacts = personFacts {
            
            let fact = personFacts.remove(at: randomIndex(fromArray: personFacts))
            steveAndBillFacts.updateValue(personFacts, forKey: person)
            return (person, fact)
        } else {
            return ("No person", "No Fact")
        }
    }
    
    func fillRandomFacts() {
        
        while !(steveAndBillFacts["Steve Jobs"]!.isEmpty) || !(steveAndBillFacts["Bill Gates"]!.isEmpty) {
            randomFacts.append(getRandomFact())
            
        }
        print(randomFacts.count)
        print(steveAndBillFacts)
        
    }
    
    func showFact() {
        if randomFacts.isEmpty {
            restartButton.isHidden = false
        } else {
        let factTuple = randomFacts.remove(at: 0)
        factLabel.text = factTuple.fact
        correctPerson = factTuple.person
        }
    }
    @IBAction func steveButtonPressed(_ sender: UIButton) {
        if correctPerson == "Steve Jobs" {
            if let score = Int(scoreLabel.text!) {
            scoreLabel.text = "\(score + 1)"
            }
            showFact()
        } else {
            showFact()
        }
    }
    @IBAction func billButtonPressed(_ sender: UIButton) {
        if correctPerson == "Bill Gates" {
            if let score = Int(scoreLabel.text!) {
                scoreLabel.text = "\(score + 1)"
            }
            showFact()
        } else {
            showFact()
        }
    }
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        scoreLabel.text = "0"
        createFacts()
        fillRandomFacts()
        showFact()
        
        restartButton.isHidden = true
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
