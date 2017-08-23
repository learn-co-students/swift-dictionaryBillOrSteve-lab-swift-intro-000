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
    
    var billAndSteveFacts : [String : [String]] = [:]
    
    var correctPerson : String = ""
    
    var userGuess : String = ""
    
    var scoreCounterValue = 0
    
    @IBOutlet weak var factLabel: UILabel!
    
    @IBOutlet weak var scoreCounter: UILabel!
    
    @IBOutlet weak var steveButton: UIButton!
    
    @IBOutlet weak var billButton: UIButton!
    
    @IBAction func pressedSteve(_ sender: Any) {
         userGuess = "Steve Jobs"
        
        if(correctPerson == userGuess){
            scoreCounterValue += 1
            scoreCounter.text = String(scoreCounterValue)
        }
        
        showFact()
    }
    
    @IBAction func pressedBill(_ sender: Any) {
        userGuess = "Bill Gates"
        
        if(correctPerson == userGuess){
            scoreCounterValue += 1
            scoreCounter.text = String(scoreCounterValue)
        }
        
        showFact()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreCounter.text = String(scoreCounterValue)
        createFacts()
        showFact()
    }
    
    func createFacts(){
        let billFacts = ["He aimed to become a millionare by the age of 30. However, he became a billionaire at age 31.",
                         "He scored 1590 (out of 1600) on his SATs.",
                         "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                         "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                         "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                         "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut(he was rejected) and even considered starting a computer company in the Soviet Union.",
                         "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                         "He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    func showFact(){
        let randomFact = getRandomFact()
        
        correctPerson = randomFact.1 //person
        factLabel.text = randomFact.0 //fact
    }
    
    
    func getRandomFact() -> (String, String){
        let person = randomPerson()
        var fact = ""
    
        if var listOfFacts = billAndSteveFacts[person]{
            
                let index = randomIndex(fromArray: listOfFacts)
                fact = listOfFacts[index]
        
        }
        
        return (fact, person)
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
