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
    var billAndSteveFacts: [String: [String]] = [:]
    var count = 0
    var attemptCounter = 0
    var correctPerson: String = ""
    
    @IBOutlet weak var counter: UILabel!
    
    @IBOutlet weak var facts: UILabel!
    
    @IBAction func steveButton(_ sender: UIButton) {
        attemptCounter += 1
        
        if attemptCounter < 9 {
            if correctPerson == "Steve Jobs"{
                count += 1
                counter.text = String(count)
            }
        }
        
        if attemptCounter >= 9 {
            facts.text = "Game Over! Thank you for playing."
        } else {
            showFact()
        }
    }
    
    @IBAction func billButton(_ sender: UIButton) {
        attemptCounter += 1
        
        if attemptCounter < 9 {
            if correctPerson == "Bill Gates"{
                count += 1
                counter.text = String(count)
            }
        }
        
        if attemptCounter >= 9 {
            facts.text = "Game Over! Thank you for playing."
        } else {
            showFact()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    // Shows New Fact
    func showFact() {
        if attemptCounter < 9 {
            let message = getRandomFact()
            correctPerson = message.0
            facts.text = message.1
        }
    }
    
    // Creates Facts
    func createFacts() {
        
        // Array of Steve Jobs facts
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish"
        ]
        
        // Array of Bill Gates facts
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        
        // Store facts in billAndSteve Dictionary
        billAndSteveFacts["Steve Jobs"] = steveFacts
        billAndSteveFacts["Bill Gates"] = billFacts
    }
    
    // Gets a random fact from dictionary
    func getRandomFact() -> (String, String) {
        
        // key
        let person = randomPerson()
        
        // array definition
        var temp = billAndSteveFacts[person]
        
        // index of info
        let index = randomIndex(fromArray: temp!)
        
        // actual info
        let fact = temp?[index]
        
        // Return Key and Info
        let pl = (icon: person, info: fact!)
        return pl
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
