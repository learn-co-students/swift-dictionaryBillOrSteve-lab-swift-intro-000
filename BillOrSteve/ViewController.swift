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
    var answer = ""
    var finalQuestion = ""
    var score = 0
    var outOf = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFacts()
    }
    
    func createFacts() {
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    @IBAction func steveButton(_ sender: Any) {
        outOf = outOf + 1
        if outOf < 10 {
        if answer == "Steve Jobs" {
            score = score + 1
            scoreLabel.text = "\(score) Right"
            factLabel.text = "RIGHT!!!"
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                // Your code with delay
                self.showFacts()
            }
        } else {
            factLabel.text = "WRONG!!!"
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                // Your code with delay
                self.showFacts()
            }
        }
        } else {
            scoreLabel.text = "You scored \(score) out of 9"
        }
    }
    @IBAction func billButton(_ sender: Any) {
        outOf = outOf + 1
        if outOf < 10 {
        if answer == "Bill Gates" {
            score = score + 1
            scoreLabel.text = "\(score) Right"
            factLabel.text = "RIGHT!!!"
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                // Your code with delay
                self.showFacts()
            }
        } else {
            factLabel.text = "WRONG!!!"
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                // Your code with delay
                self.showFacts()
            }
        }
        } else {
            scoreLabel.text = "You scored \(score) out of 9"
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
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        let arrayName = billAndSteveFacts[person]
        
        if let name = arrayName {
            let index = randomIndex(fromArray: name)
            let question = name[index]
            return (person, question)
        } else {
            return (person, "No facts left")
        }
    }
    
    func showFacts() {
        let fact = getRandomFact()
        answer = fact.0
        finalQuestion = fact.1
        factLabel.text = finalQuestion
        
    }
    
}
