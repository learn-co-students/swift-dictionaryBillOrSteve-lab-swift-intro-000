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
    var billAndSteveFacts: [String : [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    func refreshView() -> () {
        self.viewDidLoad()
        self.viewWillAppear(true)
    }
    
    var rightAnswer: String = ""
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBAction func restartButton(_ sender: Any) {
        self.refreshView()
        scoreCounter.text = "0"
    }
    
    
    @IBAction func pressSteveButton(_ sender: Any) {
        var newScore = Int(scoreCounter.text!)
        if ((billAndSteveFacts["Steve Jobs"]?.isEmpty)! && (billAndSteveFacts["Bill Gates"]?.isEmpty)!) {
            answerLabel.text = "Game Over!"
        }
        else if rightAnswer == "Steve Jobs" {
           answerLabel.text = "Correct!"
            scoreCounter.text = "\(newScore! + 1)"
            showFact()
        } else {
            answerLabel.text = "Incorrect!"
        }
    }
    
    @IBAction func pressBillButton(_ sender: Any) {
        var newScore = Int(scoreCounter.text!)
        if ((billAndSteveFacts["Steve Jobs"]?.isEmpty)! && (billAndSteveFacts["Bill Gates"]?.isEmpty)!) {
            answerLabel.text = "Game Over!"
        }
        else if rightAnswer == "Bill Gates" {
            answerLabel.text = "Correct!"
            scoreCounter.text = "\(newScore! + 1)"
            showFact()
        } else {
            answerLabel.text = "Incorrect!"
        }
    }
    
    func showFact() {
        let newFact = getRandomFact()
        print(newFact.1)
        factLabel.text = newFact.1
        if newFact.0 == "Steve Jobs" {
            rightAnswer = "Steve Jobs"
        } else {
            rightAnswer = "Bill Gates"
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
    
    func createFacts() {
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.", "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    func getRandomFact() -> (person: String, fact: String) {
        var subject = randomPerson()
        if subject == "Steve Jobs" {
            if (billAndSteveFacts["Steve Jobs"]?.isEmpty)! {
                subject = "Bill Gates"
                let factNumber = randomIndex(fromArray: billAndSteveFacts["Bill Gates"]!)
                var fact = ("Bill Gates", billAndSteveFacts["Bill Gates"]![factNumber])
                billAndSteveFacts["Bill Gates"]!.remove(at: factNumber)
                if ((billAndSteveFacts["Bill Gates"]?.isEmpty)! && (billAndSteveFacts["Steve Jobs"]?.isEmpty)!) {
                    fact = ("Your Score", "Your Score: \(scoreCounter.text!)")
                    return fact
                } else {
                    return fact
                }
            }
            let factNumber = randomIndex(fromArray: billAndSteveFacts["Steve Jobs"]!)
            var fact = ("Steve Jobs", billAndSteveFacts["Steve Jobs"]![factNumber])
            billAndSteveFacts["Steve Jobs"]!.remove(at: factNumber)
            if ((billAndSteveFacts["Steve Jobs"]?.isEmpty)! && (billAndSteveFacts["Bill Gates"]?.isEmpty)!) {
                fact = ("Your Score", "Your Score: \(scoreCounter.text!)")
                return fact
            } else {
            return fact
            }
        }
        else {
            if (billAndSteveFacts["Bill Gates"]?.isEmpty)! {
                subject = "Steve Jobs"
                let factNumber = randomIndex(fromArray: billAndSteveFacts["Steve Jobs"]!)
                var fact = ("Steve Jobs", billAndSteveFacts["Steve Jobs"]![factNumber])
                billAndSteveFacts["Steve Jobs"]!.remove(at: factNumber)
                if ((billAndSteveFacts["Steve Jobs"]?.isEmpty)! && (billAndSteveFacts["Bill Gates"]?.isEmpty)!) {
                    fact = ("Your Score", "Your Score: \(scoreCounter.text!)")
                    return fact
                } else {
                    return fact
                }
            }
            let factNumber = randomIndex(fromArray: billAndSteveFacts["Bill Gates"]!)
            var fact = ("Bill Gates", billAndSteveFacts["Bill Gates"]![factNumber])
            billAndSteveFacts["Bill Gates"]!.remove(at: factNumber)
            if ((billAndSteveFacts["Bill Gates"]?.isEmpty)! && (billAndSteveFacts["Steve Jobs"]?.isEmpty)!) {
                fact = ("Your Score", "Your Score: \(scoreCounter.text!)")
                return fact
            } else {
                return fact
            }
        }
    }
}
