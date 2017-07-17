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
    var randomFacts: [String: [String]] = [:]
    var correctPerson: String = ""
    var correct = 0
    var currentQuestion = 1
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.isEnabled = false
        playAgainButton.isHidden = true
        createFacts()
        showFact()
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
        
        randomFacts["Steve Jobs"] = steveFacts
        randomFacts["Bill Gates"] = billFacts
        
    }
    
    @IBAction func stevePressed(_ sender: Any) {
        
        if (correctPerson == "Steve Jobs") {
            increaseCounter()
        }
        
        if (isGameFinished() == false) {
            currentQuestion += 1
            scoreCounter.text = "\(correct) / \(currentQuestion)"
            showFact()
        }
        else {
            scoreCounter.text = "\(correct) / 9"
        }
        
    }
    
    @IBAction func billPressed(_ sender: Any) {
        
        if (correctPerson == "Bill Gates") {
            increaseCounter()
        }
        
        if (isGameFinished() == false) {
            currentQuestion += 1
            scoreCounter.text = "\(correct) / \(currentQuestion)"
            showFact()
        }
        else {
            scoreCounter.text = "\(correct) / 9"
        }
        
    }
    @IBAction func playAgainPressed(_ sender: Any) {
        
        //Reset values
        playAgainButton.isEnabled = false
        playAgainButton.isHidden = true
        
        steveButton.isEnabled = true
        steveButton.isHidden = false
        billButton.isEnabled = true
        billButton.isHidden = false
        
        resetCounter()
        createFacts()
        showFact()
        
    }
    
    func showFact() {
        
        let currentFact = getRandomFact()
        factLabel.text = currentFact.1
        correctPerson = currentFact.0
        
    }
    
    func increaseCounter() {
        
        correct += 1
        
    }
    func resetCounter() {
        
        correct = 0
        currentQuestion = 1
        scoreCounter.text = "\(correct) / \(currentQuestion)"
        
    }
    
    func isGameFinished() -> Bool {
        
        //Game is over
        if (randomFacts["Steve Jobs"]!.isEmpty && randomFacts["Bill Gates"]!.isEmpty) {
            
            //Disable
            steveButton.isEnabled = false
            steveButton.isHidden = true
            billButton.isEnabled = false
            billButton.isHidden = true
            
            //Enable
            playAgainButton.isEnabled = true
            playAgainButton.isHidden = false
            
            factLabel.text = "You got \(correct) out of 9 facts correct!"
            
            return true
            
        }
        else {
            return false
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
    
    func getRandomFact() -> (String, String) {
        
        let currentPerson = randomPerson()
        
        //Get array of facts from current person
        let facts = randomFacts[currentPerson]
        
        if let facts = facts {
            
            if (facts.isEmpty) {
                return getRandomFact()
            }
            else {
                
                //Get random fact from random index
                let index = randomIndex(fromArray: facts)
                let randomFact = facts[index]
                
                //Remove current fact from dictionary
                randomFacts[currentPerson]!.remove(at: index)
                
                return (currentPerson, randomFact)
                
            }
            
        }
        else {
            return ("Error", "Error")
        }
        
    }
    
}
