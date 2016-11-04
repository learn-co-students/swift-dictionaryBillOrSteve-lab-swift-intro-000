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
            print("Bill Gates Portrait Pressed!")
//            showFact()
        case steveJobsPortrait:
            print("Steve Jobs Portrait Pressed!")
//            showFact()
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

    /*
     TODO:
     - randomFact needs to be updated with the counter within showFact
     // update these counters in an switch statement. Maybe ternary?
     //        correctCounter.text = ""
     //        wrongCounter.text = ""
     */
    
    func showFact() {
        let nameOfCeo = getRandomFact().0
        let factOfCeo = getRandomFact().1
        var correctPerson: String = nameOfCeo
        displayText.text = factOfCeo
    }
    
    func checkForWin() {
        // dump this in show fact at the end or tuck it in the ibaction to check after every press.
        // restarts the game, or show play again button.
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
