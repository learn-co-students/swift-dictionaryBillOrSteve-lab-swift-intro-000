//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var factLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var steveButton: UIButton!
    @IBOutlet var billButton: UIButton!
    
    var facts = [String : [String]]()
    var person = ""
    var score = 0
    
    
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
                         "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                          "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                          "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                          "He was a pescetarian, meaning he ate no meat except for fish."]
        
        facts["Bill Gates"] = billFacts
        facts["Steve Jobs"] = steveFacts
    }
    
    func showFact() {
        let fact = getRandomFact()
        
        factLabel.text = fact.fact
        person = fact.name
    }
    
    func getRandomFact() -> (name: String, fact: String) {
        let person = randomPerson()
        if let factArray = facts[person] {
            let index = randomIndex(fromArray: factArray)
            return (person, factArray[index])
        } else {
            return ("Error", "Could not get random fact.")
        }
    }
    @IBAction func billButtonTapped(_ sender: UIButton) {
        if person == "Bill Gates" {
            score += 1
            scoreLabel.text = "\(score)"
            showFact()
        } else {
            let ac = UIAlertController(title: "Oops", message: "Guess Again", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    @IBAction func steveButton(_ sender: UIButton) {
        if person == "Steve Jobs" {
            score += 1
            scoreLabel.text = "\(score)"
            showFact()
        } else {
            let ac = UIAlertController(title: "Oops", message: "Guess Again", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
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
    
}
