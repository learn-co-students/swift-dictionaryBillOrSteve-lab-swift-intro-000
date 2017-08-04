//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var billAndSteveFacts: [String: [String]] = [:]
    var correctPerson: String = ""
    var correctGuess = false
    var numberOfCorrectGuesses = 0
    var currentFactPair: (name: String, fact: String) = ("", "")
    var numberOfGuesses = 1
    var maxGuesses = 0
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var selectSteve: UIButton!
    @IBOutlet weak var selectBill: UIButton!
    
    @IBAction func selectPerson(_ sender: UIButton) {
        let guessPair = (correctPerson, sender)
        switch guessPair {
        case ("Steve Jobs", selectSteve), ("Bill Gates", selectBill):
            correctGuess = true
            numberOfCorrectGuesses += 1
            scoreLabel.text = String(numberOfCorrectGuesses)
            removeFact()
        default:
            correctGuess = false
        }
        if numberOfGuesses < maxGuesses {
            showFact()
            numberOfGuesses += 1
        } else {
            factLabel.text = "Game over!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    func showFact() {
        currentFactPair = getRandomFact()
        correctPerson = currentFactPair.name
        factLabel.text = currentFactPair.fact
    }
    
    func createFacts() {
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a millionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nations World Health Organizaton.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        let steveFacts = [
            "He took a calligraphy course, which was instrumental in the future products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union",
            "He actually served as a mentor for Google founders Sergey Brin and Larryt Page, even sharing some of his advisors with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        maxGuesses = billFacts.count + steveFacts.count
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    func getRandomFact() -> (String, String) {
        var randomFact: (name: String, fact: String)
        randomFact.name = randomPerson()
        if let factsArray = billAndSteveFacts[randomFact.name] {
            let index = randomIndex(fromArray: factsArray)
            randomFact.fact = factsArray[index]
        } else {
            randomFact.fact = "No random facts found."
        }
        return randomFact
    }
    
    func removeFact() {
        if let factsArray = billAndSteveFacts[correctPerson] {
            var factsArrayChange = factsArray
            if let removeIndex = factsArrayChange.index(of: currentFactPair.fact) {
                factsArrayChange.remove(at: removeIndex)
            }
            billAndSteveFacts[correctPerson] = factsArrayChange
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
    
}
