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
    var selectedPerson: String = ""
    
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
    
    @IBAction func answerGuessed(_ sender: UIButton) {
        switch sender {
        case billGatesPortrait:
            selectedPerson = "Bill Gates"
            showFact()
            checkForWin()
        case steveJobsPortrait:
            selectedPerson = "Steve Jobs"
            showFact()
            checkForWin()
        default:
            displayText.text = "Nothing was selected!"
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
    
    func showFact() {
        var correctlyGuessed = 0
        var incorrectlyGuessed = 0
        var returnedTuple = getRandomFact()
        var correctPerson = returnedTuple.0
        var factOfCeo = returnedTuple.1
        displayText.text = factOfCeo
        
        if selectedPerson == "" {
            print("Game just started, selectedPerson is empty")
        } else if selectedPerson != "" && selectedPerson != nil {
            if selectedPerson == correctPerson {
                print("correctPerson comparison to selectedPerson is being checked.")
                correctlyGuessed += 1
                print(correctlyGuessed, incorrectlyGuessed)
                correctCounter.text = String(correctlyGuessed)
                wrongCounter.text = String(incorrectlyGuessed)
            } else if selectedPerson != correctPerson {
                print("incorrectlyGuessed is being run")
                incorrectlyGuessed += 1
                print(correctlyGuessed, incorrectlyGuessed)
                correctCounter.text = String(correctlyGuessed)
                wrongCounter.text = String(incorrectlyGuessed)
            }
        }
    }

    func checkForWin() {
        
        if correctCounter.text == "9" {
            print("Game Won!")
            displayText.text = "You Won!"
            startButton.isHidden = false
            startButton.setTitle("Play Again?", for: .normal)
            steveJobsPortrait.isHidden = true
            billGatesPortrait.isHidden = true
        } else if wrongCounter.text == "9" {
            print("You Lost!")
            startButton.isHidden = false
            startButton.setTitle("Play Again?", for: .normal)
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

/*
 - When the game started, the first fact was Steve's, but gave wrong counter 1 figure this out, possibly that the var doesnt change in time?
 - The counters nuke everything and doesn't retain the state, which indicates that the function running again nukes, needs to store the property elsewhere?
 */


