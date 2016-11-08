//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var steveJobsPortrait: UIButton!
    @IBOutlet weak var billGatesPortrait: UIButton!
    @IBOutlet weak var correctCounter: UILabel!
    @IBOutlet weak var wrongCounter: UILabel!
    
    var billAndSteveFacts: [String : [String]] = [:]
    var correctPerson: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
    }
    
    func createFacts() {
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shoed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he at no meat except for fish."
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
    
    // The selected person stays on for the next one. The timing of the check needs to be separated and done a step before the way it's being done now.
    
    @IBAction func answerGuessed(_ sender: UIButton) {
        switch sender {
        case billGatesPortrait:
            print("Bill Gates Portrait Pressed!")
            var selectedPerson = "Bill Gates"
            showFact()
            checkForWin(choice: selectedPerson)
        case steveJobsPortrait:
            print("Steve Jobs Portrait Pressed!")
            var selectedPerson = "Steve Jobs"
            showFact()
            checkForWin(choice: selectedPerson)
        default:
            print("Nothing registered")
        }
    }
    
    @IBAction func didStartGame(_ sender: UIButton) {
        startButton.isHidden = true
        showFact()
    }
    
    func getRandomFact() -> (personKey: String, factFromKey: String) {
        var indexFromArr: Int = 0
        var personKey = randomPerson()
        var factFromKey: String = ""
        
        if let constFactFromKey = billAndSteveFacts[personKey] {
            indexFromArr = randomIndex(fromArray: constFactFromKey)
            factFromKey = constFactFromKey[indexFromArr]
        }
        
        return (personKey, factFromKey)
    }
// need to make one call that brings in one instance of tuple, then separate that into two. Right now, it instantiates twice with two different values usually. That's why nothing else was working.
    func showFact() {
        correctPerson = getRandomFact().0
        print(correctPerson)
        let factOfCeo = getRandomFact().1
        print(factOfCeo)
        displayText.text = factOfCeo
    }
    
    /*func keepScore(yOrN: Bool) {
        var guessedCorrect = 0
        var guessedIncorrect = 0
        
        if yOrN {
            guessedCorrect += 1
            var intToStrCounterTrue = String(guessedCorrect)
            var intToStrCounterFalse = String(guessedIncorrect)
            correctCounter.text = intToStrCounterTrue
            wrongCounter.text = intToStrCounterFalse
        } else {
            guessedIncorrect += 1
            var intToStrCounterTrue = String(guessedCorrect)
            var intToStrCounterFalse = String(guessedIncorrect)
            correctCounter.text = intToStrCounterTrue
            wrongCounter.text = intToStrCounterFalse
        }
    }*/

    func checkForWin(choice: String) {
        let nameOfCeo = getRandomFact().0
        
        if correctCounter.text == "9" {
            print("Game Won!")
            displayText.text = "You Won!"
            steveJobsPortrait.isHidden = true
            billGatesPortrait.isHidden = true
        }
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
