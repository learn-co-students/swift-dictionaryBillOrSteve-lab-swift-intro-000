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
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var yourScore: UILabel!
    @IBOutlet weak var outOfNine: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var steveName: UILabel!
    @IBOutlet weak var billName: UILabel!
    
    // Create your stored properties here
    var people: [String:[String]] = [:]
    var correctPerson: String = ""
    var counterTotal = 0
    var roundCounter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.isHidden = true
        scoreCounter.text = "0"
        createFacts()
        showFact()
        
        
      
    }
    
    func createFacts() {
        people["Steve Jobs"] = ["He took a calligraphy course, which he says was instrumental in the future company product's attention to typography and font.",
            "Shortly after beeing shooed out of his company, he applied to fly on the SpaceShuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        people["Bill Gates"] = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-two game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
    }
    
    func getRandomFact() -> (String, String) {
        let choosePerson = randomPerson()
        if var chooseFacts = people[choosePerson] {
            let index = randomIndex(fromArray: chooseFacts)
            let facts = chooseFacts[index]
            chooseFacts.remove(at: index)
            return (choosePerson, facts)
        }
        return ("", "")
    }
    
    func showFact() {
        if roundCounter < 9 {
        
        var factAndPerson = getRandomFact()
        factLabel.text = factAndPerson.1
        correctPerson = factAndPerson.0
        } else {
            steveName.isHidden = true
            billName.isHidden = true
            scoreCounter.isHidden = true
            yourScore.isHidden = true
            outOfNine.isHidden = true
            factLabel.text = "You answered \(counterTotal) out of 9 questions correctly."
            billButton.isHidden = true
            steveButton.isHidden = true
            playAgainButton.isHidden = false
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
    func correctAnswer() {
        counterTotal += 1
        scoreCounter.text = String(counterTotal)
    }
    
    @IBAction func steveButtonAction(_ sender: Any) {
        if correctPerson == "Steve Jobs" {
            print("Correct")
        correctAnswer()
        
        }
        roundCounter += 1
        showFact()
    }
    
    
    @IBAction func billButtonAction(_ sender: Any) {
        if correctPerson == "Bill Gates" {
            print("Correct")
            correctAnswer()
        }
        roundCounter += 1
        showFact()
        
    }
  
    
    @IBAction func playAgain(_ sender: Any) {
        people["Bill Gates"] = nil
        people["Steve Jobs"] = nil
        createFacts()
        roundCounter = 0
        counterTotal = 0
        playAgainButton.isHidden = true
        steveButton.isHidden = false
        billButton.isHidden = false
        outOfNine.isHidden = false
        yourScore.isHidden = false
        steveName.isHidden = false
        billName.isHidden = false
        showFact()
        
        
        
    }
    
}
