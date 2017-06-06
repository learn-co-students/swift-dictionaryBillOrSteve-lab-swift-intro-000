//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomFactsForBillAndSteve: [String: [String]] = [:]
    var randomPerson: String = String()
    var round: Int = 0
    var score: Int = 0
    let steve = "Steve Jobs"
    let bill = "Bill Gates"
//    var billFacts = [String]()
//    var steveFacts = [String]()
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
        updateScoreLabel()
    }
    
    @IBAction func selectedSteve(_ sender: UIButton) {
        if randomPerson == steve {
            score += 1
        }
//        updateScoreLabel()
        showFact()
        updateScoreLabel()
    }
    
    @IBAction func selectedBill(_ sender: UIButton) {
        if randomPerson == bill {
            score += 1
        }
//        updateScoreLabel()
        showFact()
        updateScoreLabel()
    }
    
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func pickRandomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        //force unwrap retrieved values from the dictionary (the arrays will not be nil)
        let billFacts = randomFactsForBillAndSteve[bill]!
        let steveFacts = randomFactsForBillAndSteve[steve]!
        
        //reset game after 9 rounds
        if steveFacts.isEmpty && billFacts.isEmpty {
            updateScoreLabel()
            resetGame()
            if randomNumber == 0 {
                return steve
            } else {
                return bill
            }
        } else {
            if randomNumber == 0 {
                if !steveFacts.isEmpty {
                    return steve
                }
                return bill
            } else if !billFacts.isEmpty {
                return bill
            }
                return steve
        }
    }
    //populate randomFacts dictionary
    func createFacts() {
      let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
//                      "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
//                      "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
//                      "He was a pescetarian, meaning he ate no meat except for fish."
        ]
       let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                     "He scored 1590 (out of 1600) on his SATs.",
//                     "His foundation spends more on global health each year than the United Nation's World Health Organization.",
//                     "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
//                     "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        randomFactsForBillAndSteve[steve] = steveFacts
        randomFactsForBillAndSteve[bill] = billFacts
        
    }
    //retrieve a random fact about a person
    func getRandomFact() -> (String, String) {
        let person = pickRandomPerson()
        var index = 0
        var randomFact = String()
        if var personFacts = randomFactsForBillAndSteve[person] {
            index = randomIndex(fromArray: personFacts)
            
            //remove retrieved fact from randomFactsForBillAndSteve dictionary
            randomFact = personFacts[index]
            personFacts.remove(at: index)
            randomFactsForBillAndSteve.updateValue(personFacts, forKey: person)
            }
        return (person, randomFact)
    }

    func showFact() {
        let personAndFact: (person: String, fact: String) = getRandomFact()
        randomPerson = personAndFact.person
        factLabel.text = personAndFact.fact
        round += 1
    }

    func updateScoreLabel() {
        scoreLabel.text = "\(score) / \(round)"
    }
    
    func resetGame() {
        createFacts()
        score = 0
        round = 0
    }
}
