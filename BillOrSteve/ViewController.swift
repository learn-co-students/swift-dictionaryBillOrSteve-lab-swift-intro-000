//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreCounter: UILabel!
    @IBOutlet var factLabel: UILabel!
    var facts: [String : [String]] = [:]// Create your stored properties here
    var correctPerson = ""
    var count = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    @IBAction func steve(_ sender: Any) {
        if correctPerson == "Steve Jobs" {
            count += 1
            score += 1
            scoreCounter.text = "\(String(score))/9"
        }
        else {
            count += 1
        }
        if count < 9 {
            showFact()
            print(count)
        } else {
            theEnd()
        }
    }
    
    @IBAction func bill(_ sender: Any) {
        if correctPerson == "Bill Gates" {
            count += 1
            score += 1
            scoreCounter.text = "\(String(score))/9"
        } else {
            count += 1
        }
        if count < 9 {
            showFact()
        } else {
            theEnd()
        }
    }
    
    func theEnd() {
        factLabel.text = "That's all folks!"
    }

    func showFact() {
        let fact = getRandomFact()
        correctPerson = fact.0
        factLabel.text = fact.1
        facts[correctPerson]?.remove(at: fact.2)
    }
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func createFacts() {
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.","He scored 1590 (out of 1600) on his SATs.","His foundation spends more on global health each year than the United Nation's World Health Organization.","The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.","In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.","Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.","He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.","He was a pescetarian, meaning he ate no meat except for fish."]
        
        facts["Bill Gates"] = billFacts
        facts["Steve Jobs"] = steveFacts
    }
    
    func getRandomFact() -> (String,String,Int) {
        let randomPers = randomPerson()
        if !(facts[randomPers]?.isEmpty)! {
            let randomFact = randomIndex(fromArray: facts[randomPers]!)
            var random = facts[randomPers]
            return (randomPers, random![randomFact],randomFact)
        } else {
            switch randomPers {
                case "Bill Gates":
                    if !((facts["Steve Jobs"]?.isEmpty)!) {
                        let randomPers = "Steve Jobs"
                        let randomFact = randomIndex(fromArray: facts[randomPers]!)
                        var random = facts[randomPers]
                        return (randomPers, random![randomFact],randomFact)
                    }
                    break
                case "Steve Jobs":
                    if !((facts["Bill Gates"]?.isEmpty)!) {
                        let randomPers = "Bill Gates"
                        let randomFact = randomIndex(fromArray: facts[randomPers]!)
                        var random = facts[randomPers]
                        return (randomPers, random![randomFact],randomFact)
                    }
                    break
                default:
                    break
            }
        }
        return ("","",0)
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
