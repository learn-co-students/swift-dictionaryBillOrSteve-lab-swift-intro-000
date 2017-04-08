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
    
    @IBOutlet weak var scoreCounter: UILabel!
    
    @IBOutlet weak var steveButton: UIButton!
    
    @IBOutlet weak var billBUtton: UIButton!
    
    
    // Create your stored properties here
    var billAndSteveFacts: [String: [String]] = [:]
    var correctPerson: String = ""
    var score = 0


    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    // Helper Functions
    
    func delay(delay:Double, closure:@escaping ()->())
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay)
        {
            closure()
        }
    }
    
    func showFact()
    {
        let (person, fact) = getRandomFact()
        correctPerson = person
        factLabel.text = fact
    }
    
    func getRandomFact() -> (String, String)
    {
        let person = randomPerson()
        if let personsFacts = billAndSteveFacts[person]
        {
            let factIndex = randomIndex(fromArray: personsFacts)
            let fact = personsFacts[factIndex]
            return (person, fact)
            
        }
        else
        {
            return ("nil", "nil")
        }
    }

        func createFacts(){
            let billGatesFacts =
                ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                 "He scored 1590 (out of 1600) on his SATs.",
                 "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                 "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                 "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
                ]
            
            let steveJobsFacts =
                ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                 "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                 "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                 "He was a pescetarian, meaning he ate no meat except for fish."
                ]
            
            billAndSteveFacts["Bill Gates"] = billGatesFacts
            billAndSteveFacts["Steve Jobs"] = steveJobsFacts
        }
        
        func randomIndex(fromArray array: [String]) -> Int {
            return Int(arc4random_uniform(UInt32(array.count)))
        }
        
        func randomPerson() -> String
        {
            let randomNumber = arc4random_uniform(2)
            
            if randomNumber == 0
            {
                return "Steve Jobs"
            }
            else
            {
                return "Bill Gates"
            }
        
        }
        
        
        @IBAction func steveButtonPressed(_ sender: UIButton)
        {
            if correctPerson == "Steve Jobs"
            {
                score += 1
                scoreCounter.text = String(score)
                factLabel.text = "Correct Answer"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
                {
                    self.showFact()
                }
            }
            else
            {
                factLabel.text = "Incorrect Answer"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
                {
                    self.showFact()
                }
            }
        }
        
        @IBAction func billButtonPressed(_ sender: UIButton)
        {
            if correctPerson == "Bill Gates"
            {
                score += 1
                scoreCounter.text = String(score)
                factLabel.text = "Correct Answer"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
                {
                    self.showFact()
                }
            }
            else
            {
                factLabel.text = "Incorrect Answer"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
                {
                    self.showFact()
                }
            }
        }
}
