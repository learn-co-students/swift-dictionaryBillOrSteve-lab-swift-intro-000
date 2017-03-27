//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var facts: [String:[String]] = [:]
    var correctPerson: String = ""
    var score: Int = 0
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    func createFacts() {
        
        facts.updateValue([
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
            ], forKey: "Steve Jobs")
        
        facts.updateValue([
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
            ], forKey: "Bill Gates")
        
    }
    
    func getRandomFact() -> (fact: String, belongsTo: String) {
        
        var person = randomPerson()
        
        if var factList = facts[person] {
            
            // Change person if we run out of facts for the random person
            if factList.count == 0 {
                person = person == "Bill Gates" ? "Steve Jobs" : "Bill Gates"
                factList = facts[person]!
            }
            
            let index = randomIndex(fromArray: factList)
            let fact = factList[index]
            
            return (fact, person)
            
        }
        
        return("", "")
        
    }
    
    func showFact() {
        
        let fact = getRandomFact()
        
        factLabel.text = fact.fact
        correctPerson = fact.belongsTo
        
        // Remove fact from facts array
        if let personFacts = facts[fact.belongsTo] {
            
            var temp = personFacts
            temp.remove(at: temp.index(of: fact.fact)!)
            facts[fact.belongsTo] = temp
            
        }
        
    }
    
    @IBAction func clickSteve(_ sender: Any) {
        guess("Steve Jobs")
    }
    
    @IBAction func clickBill(_ sender: Any) {
        guess("Bill Gates")
    }
    
    func guess(_ person: String) {
        
        if person == correctPerson {
            score += 1
            scoreLabel.text = "\(score) / 9"
        }
        
        var factsRemaining = (facts["Bill Gates"]?.count)! + (facts["Steve Jobs"]?.count)!
        
        // Game over if we're out of facts
        if factsRemaining == 0 {
            
            factLabel.text = "Game over! You scored \(score) out of 9!"
            steveButton.isHidden = true
            billButton.isHidden = true
            scoreLabel.isHidden = true
            
            return
        }
        
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
    
}
