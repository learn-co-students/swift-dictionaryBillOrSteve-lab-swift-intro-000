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
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var billAndSteveFacts: [String: [String]] = [:]
    var correctPerson: String = ""
    var score = 0
    var attemptCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    @IBAction func personSelected(_ sender: UIButton) {
        if let title = sender.currentTitle {
            var chosenPerson: String = ""
            switch title {
            case "bill":
                chosenPerson = "Bill Gates"
            case "steve":
                chosenPerson = "Steve Jobs"
            default:
                break
            }
            if chosenPerson == correctPerson {
                score += 1
                scoreLabel.text = "\(score) / 9"
            }
            showFact()
        } else {
            print("Error: Image button has no title")
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
    
    func showFact() {
        if attemptCount < 9 {
            correctPerson = randomPerson()
            if let facts = billAndSteveFacts[correctPerson] {
                var updatedFacts = facts
                if updatedFacts.isEmpty {
                    switch correctPerson {
                    case "Bill Gates":
                        correctPerson = "Steve Jobs"
                    default:
                        correctPerson = "Bill Gates"
                    }
                }
                updatedFacts = billAndSteveFacts[correctPerson]!
                let index = randomIndex(fromArray: updatedFacts)
                factLabel.text = updatedFacts[index]
                updatedFacts.remove(at: index)
                billAndSteveFacts[correctPerson] = updatedFacts
                attemptCount += 1
            } else {
                print("Error: got person whose facts we don't have")
            }
        } else {
            print("All attempts made")
            correctPerson = ""
        }
    }
    
    func createFacts() {
        billAndSteveFacts["Bill Gates"] = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        billAndSteveFacts["Steve Jobs"] = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
    }
    
}
