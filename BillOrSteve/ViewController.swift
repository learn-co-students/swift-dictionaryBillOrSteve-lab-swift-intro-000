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
    
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var steve: UIButton!
    @IBOutlet weak var bill: UIButton!
    
    var billAndSteveFacts: [String : [String]] = [:]
    var correctPerson: String = ""
    var counter: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createfacts()
        showFacts()
    }
    
    @IBAction func steveGuess(_ sender: Any) {
        if correctPerson == "Steve Jobs" {
            counter += 1
            scoreCounter.text = String(counter)
        }
        showFacts()
    }
    
    @IBAction func billGuess(_ sender: Any) {
        if correctPerson == "Bill Gates" {
            counter += 1
            scoreCounter.text = String(counter)
        }
        showFacts()
    }
    
    func createfacts() {
        let steveFact = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        
        let billFact = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            
            "He scored 1590 (out of 1600) on his SATs.",
            
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        
        billAndSteveFacts["Steve Jobs"] = steveFact
        billAndSteveFacts["Bill Gates"] = billFact
    }
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        
        if let facts = billAndSteveFacts[person] {
            let fact = factWithoutRepeat(from: facts, with: person)
             return  (person, fact)
        }
        
        let otherPerson = person == "Bill Gates" ? "Steve Jobs" : "Bill Gates"
        
        if let facts = billAndSteveFacts[otherPerson] {
            let fact = factWithoutRepeat(from: facts, with: otherPerson)
            return  (otherPerson, fact)
        }

        
        steve.isUserInteractionEnabled = false
        bill.isUserInteractionEnabled = false
        return("", "GameOver")
    }
    
    func showFacts() {
        let (person, fact) = getRandomFact()
        
        correctPerson = person
        factLabel.text = fact
        
    }
    
    func factWithoutRepeat(from array: [String], with person: String) -> String {
        var copy = array
        let index = randomIndex(fromArray: copy)
        let fact = copy[index]
        copy.remove(at: index)
        billAndSteveFacts[person] = copy.isEmpty ? nil : copy
        return fact
    }

}

extension ViewController {
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        return randomNumber == 0 ? "Steve Jobs" : "Bill Gates"
    }

}
