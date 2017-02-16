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
    var triviaFacts: [String: [String]] = [:]
    var correctPerson: String = ""
    var score: Int = 0
    var round: Int = 0
    
    //IB Connections
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBAction func restart(_ sender: Any) {
        restartButton.isHidden = true
        score = 0
        round = 0
        scoreCounter.text = String(score)
        createFacts()
        showFact()
        steveButton.isHidden = false
        billButton.isHidden = false
    }
    @IBAction func guessSteve(_ sender: Any) {
        if correctPerson == "Steve Jobs" {
            print("Correct!")
            score += 1
            scoreCounter.text = String(score)
            showFact()
        } else {
            print("Incorrect!")
            showFact()
        }
    }
    @IBAction func guessBill(_ sender: Any) {
        if correctPerson == "Bill Gates" {
            print("Correct!")
            score += 1
            scoreCounter.text = String(score)
            showFact()
        } else {
            print("Incorrect!")
            showFact()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.isHidden = true
        createFacts()
        showFact()
    }
    
    // Helper Functions
    
    func createFacts() {
        let billFacts: [String] = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        
        let steveFacts: [String] = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        
        triviaFacts["Bill Gates"] = billFacts
        triviaFacts["Steve Jobs"] = steveFacts
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
    
    func getRandomFact() -> (String?, String?) {
        var randomFact: String = ""
        var factArray: [String] = []
        var randomFactIndex: Int?
        
        switch randomPerson() {
        case "Bill Gates":
            factArray = triviaFacts["Bill Gates"]!
            if factArray.isEmpty {
                factArray = triviaFacts["Steve Jobs"]!
                randomFactIndex = randomIndex(fromArray: factArray)
                randomFact = factArray[randomFactIndex!]
                
                factArray.remove(at: randomFactIndex!)
                
                triviaFacts["Steve Jobs"] = factArray
                return (randomFact,"Steve Jobs")
            } else {
                randomFactIndex = randomIndex(fromArray: factArray)
                randomFact = factArray[randomFactIndex!]
            
                factArray.remove(at: randomFactIndex!)
            
                triviaFacts["Bill Gates"] = factArray
                return (randomFact,"Bill Gates")
            }
            
        case "Steve Jobs":
            factArray = triviaFacts["Steve Jobs"]!
            if factArray.isEmpty {
                factArray = triviaFacts["Bill Gates"]!
                randomFactIndex = randomIndex(fromArray: factArray)
                randomFact = factArray[randomFactIndex!]
                
                factArray.remove(at: randomFactIndex!)
                
                triviaFacts["Bill Gates"] = factArray
                return (randomFact,"Bill Gates")
            } else {
                randomFactIndex = randomIndex(fromArray: factArray)
                randomFact = factArray[randomFactIndex!]
                
                factArray.remove(at: randomFactIndex!)
                
                triviaFacts["Steve Jobs"] = factArray
                return (randomFact,"Steve Jobs")
            }
            
        default:
            return (nil, nil)
        }
    }
    
    func showFact() {
        if round == 9 {
            factLabel.text = "You scored \(score) out of \(round) questions correct!"
            billButton.isHidden = true
            steveButton.isHidden = true
            restartButton.isHidden = false
        } else {
            let randomFact = getRandomFact()
            factLabel.text = randomFact.0
            correctPerson = randomFact.1!
            round += 1
        }
    }
    
}
