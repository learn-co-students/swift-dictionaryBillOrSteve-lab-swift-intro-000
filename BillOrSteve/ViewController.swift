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
    @IBOutlet weak var auxLabel: UILabel!
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    
    
    
    // Create your stored properties here
    var billAndSteveFacts : [String : [String]] = [:]
    var correctPerson : String = ""
    var scoreCount = 0
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFacts()
        showFact()
    }
    
    func createFacts() {
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                         "He scored 1590 (out of 1600) on his SATs.",
                         "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                         "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                         "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                          "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                          "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                          "He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }

    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        if let array = billAndSteveFacts[person] {
            let index = randomIndex(fromArray: array)
            let quote = array[index]
            billAndSteveFacts[person]?.remove(at: index)
            return (quote, person)
        }
        return ("Error", "No Person")
    }
    
    func showFact() {
        let personAndFact = getRandomFact()
        correctPerson = personAndFact.1
        
        factLabel.text = personAndFact.0
        steveButton.isEnabled = true
        billButton.isEnabled = true
        auxLabel.text = ""
        nextQuestionButton.isHidden = true
    }
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 && (billAndSteveFacts["Steve Jobs"]?.count)! > 0{
            return "Steve Jobs"
        } else if randomNumber == 1 && (billAndSteveFacts["Bill Gates"]?.count)! > 0{
            return "Bill Gates"
        } else if (billAndSteveFacts["Steve Jobs"]?.count)! > 0 {
            return "Steve Jobs"
        } else if (billAndSteveFacts["Bill Gates"]?.count)! > 0 {
            return "Bill Gates"
        }
        else {
        return "Error"
        }
    }
    
    func restart() {
        nextQuestionButton.setTitle("Next Question",for: .normal)
        scoreCount = 0
        scoreLabel.text = String(scoreCount)
        guessCount = 0
        createFacts()
        showFact()
    }
    
    @IBAction func chooseSteve(_ sender: Any) {
        guessCount += 1
        steveButton.isEnabled = false
        billButton.isEnabled = false
        
        if correctPerson == "Steve Jobs" {
            scoreCount += 1
            scoreLabel.text = String(scoreCount)
            auxLabel.text = "Correct!"
            if guessCount >= 9 {
                nextQuestionButton.setTitle("Try Again",for: .normal)
                
            }
            nextQuestionButton.isHidden = false
        }
        else {
            auxLabel.text = "Wrong!"
            if guessCount >= 9 {
                nextQuestionButton.setTitle("Try Again",for: .normal)
                
            }
            nextQuestionButton.isHidden = false
        }
    }
    
    
    @IBAction func chooseBill(_ sender: Any) {
        guessCount += 1
        steveButton.isEnabled = false
        billButton.isEnabled = false
        
        if correctPerson == "Bill Gates" {
            scoreCount += 1
            scoreLabel.text = String(scoreCount)
            auxLabel.text = "Correct!"
            if guessCount >= 9 {
                nextQuestionButton.setTitle("Try Again",for: .normal)
                
            }
            nextQuestionButton.isHidden = false
        }else {
            auxLabel.text = "Wrong!"
            if guessCount >= 9 {
                nextQuestionButton.setTitle("Try Again",for: .normal)
                
            }
            nextQuestionButton.isHidden = false
        }
    }
    
    
    
    @IBAction func nextQuestion(_ sender: Any) {
        if guessCount < 9 {
            showFact()
        }
        else {
            restart()
        }
    }
    
}
