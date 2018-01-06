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
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var steveLabel: UILabel!
    
    @IBAction func billButton(_ sender: Any) {
        let button: String = "Bill"
        print("pressed \(button)")
        //print("You pressed Bill, correct person was \(correctPerson)")
        if correctPerson == button {
            score += 1
            scoreLabel.text = String(score)

        }
        print("current score is \(score)")
        showFact()
        
        
    }
    @IBAction func steveButton(_ sender: Any) {
        let button: String = "Steve"
          print("pressed \(button)")
        //print("You pressed Steve, correct person was \(correctPerson)")
        if correctPerson == button {
            score += 1
            scoreLabel.text = String(score)
        }
        print("current score is \(score)")
        showFact()
    }
    
    
    
    
    // Create your stored properties here
    var billAndSteveFacts:[String: [String]] = [:]
    var correctPerson: String = "" //to store the correct person each round
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
    }
    // Helper Functions
    func showFact() {
        var (person,randomFact) = getRandomFact()
        correctPerson = person
        //print("Current correct person is \(person)")
        factLabel.text = randomFact
        //print("Random fact is \(randomFact)")
        
    }
    func createFacts() {
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.","He scored 1590 (out of 1600) on his SATs.","His foundation spends more on global health each year than the United Nation's World Health Organization.","The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.","In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.","He was a pescetarian, meaning he ate no meat except for fish."]
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    func getRandomFact() -> (String, String) {
        //fact, who it belongs to
        let person = randomPerson()
        var randomFact: String = ""
        if let factArray = billAndSteveFacts[person] {
            let factIndex = randomIndex(fromArray: factArray)
            randomFact = factArray[factIndex]
            
        }
        return (person,randomFact)
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
