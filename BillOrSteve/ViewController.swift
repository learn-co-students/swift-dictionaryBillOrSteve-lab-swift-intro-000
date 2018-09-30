//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var correctPerson: String = ""
    var billAndSteveFacts: [String:[String]] = [:]
    var score: Int = 0
    var userChoice = ""

    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var facts: UILabel!
    @IBAction func selectSteve(_ sender: Any) {
        print("Steve has been selected")
        userChoice = "Steve Jobs"
        if userChoice == correctPerson {
            print("Correct! It was Steve")
            score += 1
            scoreCounter.text = String(score)
            showFact()
        } else {
            showFact()
        }
    }
    @IBAction func selectBill(_ sender: Any) {
        print("Bill has been selected")
        userChoice = "Bill Gates"
        if userChoice == correctPerson {
            print("Correct! It was Bill")
            score += 1
            scoreCounter.text = String(score)
            showFact()
        } else {
            showFact()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    func createFacts () {
        var steveJobsFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish."]
        
        var billGatesFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.", "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        billAndSteveFacts["Bill Gates"] = billGatesFacts
        billAndSteveFacts["Steve Jobs"] = steveJobsFacts
    }
    
    func getRandomFact() -> (who: String, fact: String) {
        let randomPersonBillorSteve = randomPerson()
        if let bOrSFacts = billAndSteveFacts[randomPersonBillorSteve] {
            var ranFact = bOrSFacts[randomIndex(fromArray: bOrSFacts)]
            print("the random person is \(randomPersonBillorSteve), fact is \(ranFact)")
            return (randomPersonBillorSteve, ranFact)
        } else {
            print("Error has occured!")
            return ("Could not get random fact", "Could not get random fact")
        }
    }
    
    func showFact() {
        var generatedPair = getRandomFact()
        facts.text = generatedPair.fact
        correctPerson = generatedPair.who

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
    
}
