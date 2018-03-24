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
    var bothFacts = [String: [String]]()
    var scoreNum = 0
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
    }
    
    func createFacts() {
        let steveFact = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."]
        
        let billFact = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        bothFacts["Steve Jobs"] = steveFact
        bothFacts["Bill Gates"] = billFact
    }
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        let randomNum = randomIndex(fromArray: bothFacts[person]!)
        
        return (person, bothFacts[person]![randomNum])
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        let answer = sender.currentTitle!
        if answer == "steve" {
            updateUI(correct: isCorrect(name: "Steve Jobs"))
        } else {
            updateUI(correct: isCorrect(name: "Bill Gates"))
        }
    }
    
    func updateUI(correct: Bool) {
        if correct {
            scoreNum += 1
            score.text = "\(scoreNum)"
            factLabel.text = "\(getRandomFact().1)"
        } else {
            factLabel.text = "\(getRandomFact().1)"
        }
    }
    
    func isCorrect(name: String) -> Bool{
        let correctA = UIAlertController(title: "Correct", message: "", preferredStyle: .alert)
        let wrongA = UIAlertController(title: "Wrong", message: "", preferredStyle: .alert)
        
        for fact in bothFacts[name]! {
            if (factLabel.text == fact) {
                present(correctA, animated: true, completion: nil)
                dismiss(animated: true, completion: nil)
                return true
            }
        }
        
        present(wrongA, animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
        return false
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
