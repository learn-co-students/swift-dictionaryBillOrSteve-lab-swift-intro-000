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
    var fact = ""
    var name = ""
    var score = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    @IBOutlet weak var rightOrWrong: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFacts()
        updateFact()
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
    
    
    
    @IBAction func steveAction(_ sender: Any) {
        if name == "Steve Jobs" {
            rightOrWrong.text = "Nice!"
            increaseScore()
            
        } else {
            rightOrWrong.text = "Wrong"
        }
        updateFact()
    }
   
    @IBAction func billAction(_ sender: Any) {
        if name == "Bill Gates" {
            rightOrWrong.text = "Nice!"
            increaseScore()
        } else {
            rightOrWrong.text = "Wrong"
        }
        updateFact()
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
    
    func getRandomFact() -> (name: String, randomFact: String) {
        
        let name = randomPerson()
        var otherName = ""
        var randomFact: String = ""
        if let arrayFact = billAndSteveFacts[name] {
            let index = randomIndex(fromArray: arrayFact)
            randomFact = arrayFact[index]
            factLabel.text = randomFact
            billAndSteveFacts[name]?.remove(at: index)
        } else {
            if name == "Bill Gates" {
                otherName = "Steve Jobs"
            } else {
                otherName = "Bill Gates"
            }
            if let arrayFact = billAndSteveFacts[otherName] {
                let index = randomIndex(fromArray: arrayFact)
                randomFact = arrayFact[index]
                factLabel.text = randomFact
                billAndSteveFacts[otherName]?.remove(at: index)
            } else {
                rightOrWrong.text = "Game Over"
            }
            
        }
        
        
        return (name, randomFact)
    }
    
    func updateFact() {
        let nameAndFact = getRandomFact()
        name = nameAndFact.name
        fact = nameAndFact.randomFact
        factLabel.text = fact
    }
    

    
    func increaseScore() {
        score += 1
        scoreLabel.text = "\(score)/9"
    }
    
}
