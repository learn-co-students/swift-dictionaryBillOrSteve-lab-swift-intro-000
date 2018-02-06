//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var billAndSteveFacts: [String : [String]] = [:]
    var fact: (String, String) = ("","")
    var score: Int = 0
    var counter: Int = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        buttonsView.isHidden = false
        scoreLabel.isHidden = false
        startButton.isHidden = true
        fact = getRandomFact()
        factLabel.text = fact.1
    }
    
    @IBAction func choiceButton(_ sender: UIButton) {
        if (sender.tag) == 0 {
            if (fact.0 == "Steve Jobs") {
                correctAnswer()
            } else {
                wrongAnswer()
            }
        } else if (sender.tag) == 1 {
            if (fact.0 == "Bill Gates") {
                correctAnswer()
            } else {
                wrongAnswer()
            }
        }
        delayWithSeconds(2.0) {
            if self.counter != 9 {
                self.fact = self.getRandomFact()
                self.factLabel.text = self.fact.1
            } else {
                self.buttonsView.isHidden = true
                self.scoreLabel.isHidden = true
                self.factLabel.text = "FINAL SCORE: \(self.score) / 9\nGAME OVER"
                self.startButton.isHidden = false
            }
        }
        print(counter)
        print("Bills: \(billAndSteveFacts["Bill Gates"]?.count)")
        print("Steves: \(billAndSteveFacts["Steve Jobs"]?.count)")
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        viewDidLoad()
    }
    
    // Helper Functions
    
    func correctAnswer() {
        factLabel.text = "THAT'S CORRECT!"
            score += 1
            counter += 1
            scoreLabel.text = "\(score) / 9"
    }
    
    func wrongAnswer() {
        counter += 1
        factLabel.text = "THAT'S WRONG"
    }
    
    func getRandomFact() -> (String, String) {
        var person: String = randomPerson()
        var index: Int = 0
        if billAndSteveFacts[person]?.count != 0 {
            index = randomIndex(fromArray: billAndSteveFacts[person]!)
        } else {
            if person == "Steve Jobs" {
                person = "Bill Gates"
                index = randomIndex(fromArray: billAndSteveFacts[person]!)
            } else {
                person = "Steve Jobs"
                index = randomIndex(fromArray: billAndSteveFacts[person]!)
            }
        }
        var tuple: (String, String) = ("","")
        if var fact = billAndSteveFacts[person] {
            tuple = (person, fact[index])
            fact.remove(at: index)
            billAndSteveFacts[person] = fact
        }
        return tuple
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    func createFacts() {
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                         "He scored 1590 (out of 1600) on his SATs.",
                         "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                         "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                         "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                          "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                          "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                          "He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
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
