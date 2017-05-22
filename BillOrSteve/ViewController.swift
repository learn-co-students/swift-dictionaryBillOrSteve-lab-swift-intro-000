//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    
    // Create your stored properties here
    var facts: [String: [String]] = [:]
    var correctPerson = ""
    var score = 0
    var numberOfAsked = 0
    var numberOfQuestions = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let selection = sender.titleLabel?.text ?? ""
        if selection == correctPerson {
            score += 1
        }
        
        if isGameOver() {
           gameDidEnd()
        } else {
            scoreLabel.text = "\(score) / \(numberOfAsked) (\(getScore())%)"
            showFact()
        }
    }
}

// MARK: - Helper Functions
extension ViewController {
    func gameDidEnd() {
        scoreLabel.text = "You scored \(getScore())%!"
        billButton.isEnabled = false
        steveButton.isEnabled = false
    }
    
    func getScore() -> Double {
        return Double(score * 10000 / numberOfAsked) / 100
    }
    
    func isGameOver() -> Bool {
        return numberOfAsked == numberOfQuestions
    }

    func showFact() {
        numberOfAsked += 1
        let fact = getRandomFact()
        factLabel.text = fact.fact
        correctPerson = fact.person
        removeFact(person: fact.person, fact: fact.fact)
    }
    
    func createFacts() {
        facts = [:]
        facts["Steve Jobs"] = [String]()
        facts["Bill Gates"] = [String]()
        
        facts["Steve Jobs"]?.append("He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.")
        facts["Steve Jobs"]?.append("Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.")
        facts["Steve Jobs"]?.append("He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.")
        facts["Steve Jobs"]?.append("He was a pescetarian, meaning he ate no meat except for fish.")
        facts["Bill Gates"]?.append("He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.")
        facts["Bill Gates"]?.append("He scored 1590 (out of 1600) on his SATs.")
        facts["Bill Gates"]?.append("His foundation spends more on global health each year than the United Nation's World Health Organization.")
        facts["Bill Gates"]?.append("The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.")
        facts["Bill Gates"]?.append("In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss.")
    }
    
    func removeFact(person: String, fact: String) {
        guard let index = facts[person]?.index(of: fact) else { return }
        facts[person]?.remove(at: index)
    }
    
    func getRandomFact() -> (fact: String, person: String) {
        let exhaustedPerson = returnExhaustedPerson()
        let person: String
        
        if exhaustedPerson == nil {
            person = randomPerson()
        } else if exhaustedPerson == "Bill Gates" {
            person = "Steve Jobs"
        } else {
            person = "Bill Gates"
        }
        
        guard var personArray = facts[person] else { fatalError("Something unexpected has happened") }

        let index = randomIndex(fromArray: personArray)
        return (fact: personArray[index], person: person)
    }
    
    func returnExhaustedPerson() -> String? {
        guard let billFacts = facts["Bill Gates"], let steveFacts = facts["Steve Jobs"] else { return nil }
        
        if billFacts.isEmpty {
            return "Bill Gates"
        } else if steveFacts.isEmpty {
            return "Steve Jobs"
        } else {
            return nil
        }
    }
    
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
    
    func getOtherPerson(name: String) -> String {
        return name == "Steve Jobs" ? "Bill Gates" : "Steve Jobs"
    }
}
