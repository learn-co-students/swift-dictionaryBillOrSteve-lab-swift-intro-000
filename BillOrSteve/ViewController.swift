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
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var steveLabel: UIButton!
    
    @IBOutlet weak var billLabel: UIButton!
    
    @IBAction func steveButton(_ sender: AnyObject) {
        if correctName == "Steve Jobs" {
            score += 1
            scoreLabel.text = "\(String(score)) / 9"
            print("Steve" , randFactsTwoPeople["Steve Jobs"]?.count)
            if let steveArray = randFactsTwoPeople["Steve Jobs"] {
                for (index, f) in steveArray.enumerated(){
                    if f == fact {
                        randFactsTwoPeople["Steve Jobs"]?.remove(at: index)
                        print("Steve" , randFactsTwoPeople["Steve Jobs"]?.count)
                    }
                }
            }
            if (randFactsTwoPeople["Steve Jobs"]?.isEmpty)!{
                print(randFactsTwoPeople["Steve Jobs"]?.isEmpty)
                showFact()
                scoreLabel.text = "\(String(score)) / 9"
            } else {
            showFact()
            }
        }
    }
    
    @IBAction func billLabel(_ sender: AnyObject) {
        if correctName == "Bill Gates" {
            score += 1
            scoreLabel.text = "\(String(score)) / 9"
            print("Bill" , randFactsTwoPeople["Bill Gates"]?.count)
            if let billArray = randFactsTwoPeople["Bill Gates"] {
                for (index, f) in billArray.enumerated(){
                    if f == fact {
                        randFactsTwoPeople["Bill Gates"]?.remove(at: index)
                        print("Bill" , randFactsTwoPeople["Bill Gates"]?.count)
                    }
                }
            }
            if (randFactsTwoPeople["Bill Gates"]?.isEmpty)!{
                print(randFactsTwoPeople["Bill Gates"]?.isEmpty)
                showFact()
                scoreLabel.text = "\(String(score)) / 9"
            } else {
                showFact()
            }
        }
    }
    
    // Create your stored properties here
    
    var randFactsTwoPeople: [String : [String]] = [:]
    var correctName = ""
    var fact = ""
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFactDict()
        showFact()
    }
    
    func createFactDict() {
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                          "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                          "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                          "He was a pescetarian, meaning he ate no meat except for fish."]
        
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                         "He scored 1590 (out of 1600) on his SATs.",
                         "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                         "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                         "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        randFactsTwoPeople["Steve Jobs"] = steveFacts
        randFactsTwoPeople["Bill Gates"] = billFacts
    }
    
    func getRandomFact() -> (String, String){
        var randPerson = randomPerson() //Returns Steve or Bill
        guard !(randFactsTwoPeople["Steve Jobs"]?.isEmpty)! || !(randFactsTwoPeople["Bill Gates"]?.isEmpty)! else {
//            score += 1
            scoreLabel.text = "\(String(score)) / 9"
            return ("none", "You Won")
        }
        while (randFactsTwoPeople[randPerson]?.isEmpty)! {
            randPerson = randomPerson()
            continue
        }
        if let getFact = randFactsTwoPeople[randPerson] {
            let factIndex = randomIndex(fromArray: getFact) // Returns random Int from 0 to getFact.count
            
            fact = getFact[factIndex]
        }
        return (randPerson, fact)
    }
    
    func showFact() {
        let personAndFact = getRandomFact()
        correctName = personAndFact.0
        factLabel.text = personAndFact.1
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
    
}
