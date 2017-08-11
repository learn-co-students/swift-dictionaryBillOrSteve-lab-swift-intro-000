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
    
    var billAndSteveFacts : [String:[String]] = [:]
    var correctFact : (String , String) = ("", "")
    var score = 0
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var steveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        //print(randomIndex(fromArray: billAndSteveFacts["Bill Gates"]!))
        correctFact = getRandomFact()
        factLabel.text = correctFact.1
        resultLabel.isHidden = true
        print("\(correctFact.0)")
    }
    
    func createFacts() {
        let steveFacts = [
                "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        let facts = billAndSteveFacts[person]
        let indx = randomIndex(fromArray: facts!)
        
        if let fac = facts?[indx] {
            return(person,fac)
        }
        else {
            return("","")
        }

    }
    
    func guessPerson(person: String) {
        if correctFact.0 == person {
            resultLabel.text = "Congrats! You are correct."
            removeFact(guess: person)
            score += 1
        } else {
            resultLabel.text = "Aww. That's wrong bud."
        }
        scoreLabel.text = String(score)
        resultLabel.isHidden = false
        correctFact = getRandomFact()
        factLabel.text = correctFact.1
        print("Steve: \(String(describing: billAndSteveFacts["Steve Jobs"]?.count))")
        print("Bill: \(String(describing: billAndSteveFacts["Bill Gates"]?.count))")
        print("Next fact: \(correctFact.0)")

    }
    
    func removeFact(guess: String)  {
        var removeFromThis = billAndSteveFacts[guess]
        for (index,name) in (removeFromThis?.enumerated())! {
            if name == correctFact.1 {
                removeFromThis?.remove(at: index)
                print("index: \(index)")
                billAndSteveFacts[guess] = removeFromThis
            }
        }
        
        if removeFromThis?.count == 0 {
            resultLabel.text = "Game has ended. No more guessing"
            billButton.isEnabled = false
            steveButton.isEnabled = false
            
        }
        
        }
    
    @IBAction func guessSteve(_ sender: UIButton) {
        guessPerson(person: "Steve Jobs")
    }
    
    @IBAction func guessBill(_ sender: UIButton) {
         guessPerson(person: "Bill Gates")
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
