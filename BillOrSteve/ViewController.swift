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
    @IBOutlet weak var scoreLabel: UILabel!

    var factsDict = [String: [String]]()
    var correctPerson = ""
    var answeredCorrect = 0
    var attempts = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "0"
        createFacts()
        showFact()
    }
    
    func createFacts() {
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        
        factsDict["Bill Gates"] = billFacts
        factsDict["Steve Jobs"] = steveFacts
    }
    
    func factsLeft() { // Print for debugging
        let steve = factsDict["Steve Jobs"]
        let bill = factsDict["Bill Gates"]
        
        print("\(attempts) attempts")
        if let fSteve = steve {
            print("\(fSteve.count) Steve facts remaining")
        }
        if let fBill = bill {
            print("\(fBill.count) Bill facts remaining")
        }
    }
    
    func resetGame() {
        if attempts == 9 {
            factsDict.removeAll()
            createFacts()
            attempts = 0
            answeredCorrect = 0
            //scoreLabel.text = "0"
        }
    }
    
    func removeFact(_ person: String, _ index: Int) {
        let facts = factsDict[person]
        if var fact = facts {
            if fact.count > 0 {
                fact.remove(at: index)
                factsDict[person] = fact
            }
        }
    }
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        let facts = factsDict[person]
        
        if var fact = facts {
            if fact.count > 0 { //No more facts for this person
                let index = randomIndex(fromArray: fact)
                let currentFact = fact[index]
                
                removeFact(person, index)
                return (person, currentFact)
            }
        }
        return (person, "Error")
    }
    
    func showFact() {
        let fact = getRandomFact()
        
        correctPerson = fact.0
        factLabel.text = fact.1
    }
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        var person = ""
        
        if randomNumber == 0 { person = "Steve Jobs" }
        else { person = "Bill Gates" }
        
        let factsRemaining = factsDict[person]
        
        if let fact = factsRemaining {
            if fact.count < 1 {
                if person == "Bill Gates" {
                    return "Steve Jobs"
                } else {
                    return "Bill Gates"
                }
            } else {
                return person
            }
        }
        return person
    }
    
    
    @IBAction func billPressed(_ sender: Any) {
        attempts += 1
        if correctPerson == "Bill Gates" {
            //print("Correct answer")
            answeredCorrect += 1
            scoreLabel.text = "\(answeredCorrect)/\(attempts)"
        } else {
            //print("Wrong choice")
            scoreLabel.text = "\(answeredCorrect)/\(attempts)"
        }
        factsLeft()
        resetGame()
        showFact()
    }
    @IBAction func stevePressed(_ sender: Any) {
        attempts += 1
        if correctPerson == "Steve Jobs" {
            //print("Correct answer")
            answeredCorrect += 1
            scoreLabel.text = "\(answeredCorrect)/\(attempts)"
        } else {
            //print("Wrong choice")
            scoreLabel.text = "\(answeredCorrect)/\(attempts)"
        }
        factsLeft()
        resetGame()
        showFact()
    }
}
