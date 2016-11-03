//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var randomFact: UILabel!
    @IBOutlet weak var steveJobsPortrait: UIButton!
    @IBOutlet weak var billGatesPortrait: UIButton!
    @IBOutlet weak var correctCounter: UILabel!
    @IBOutlet weak var wrongCounter: UILabel!
    
    var billAndSteveFacts: [String : [String]] = [:]
    var currentCorrectCounter = 0
    var currentWrongCounter = 0
    
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
        getRandomFact()
        switch sender {
        case billGatesPortrait:
            print("Bill Gates Portrait Pressed!")
            showFact(fact: currentAnswer)
            updateCounterShowFact(person: currentAnswer)
        case steveJobsPortrait:
            print("Steve Jobs Portrait Pressed!")
            showFact(fact: currentAnswer)
//            updateCounterShowFact(person: currentAnswer)
        default:
            print("Nothing registered")
        }
    }
    
    // tuples passed from getRandomFact needs to go in as fact: currentAnswer and person: CurrentAnswer
    
    func getRandomFact() -> (String, String) {
        var personKey = randomPerson()
        print(personKey)
        var factValue: String = ""
        // rip through dictionary and pull out the name and the fact using randomIndex & randomPerson
        // update currentAnswer and randomFact
        // this sets the currentAnswer for the next round.
        return (personKey, factValue)
    }
    // update the counter points here and then it returns the key and the fact to display.
    // decide between tucking this within the cases, and or within answerGuessed.
    // uses randomPerson to grab a person, pulls out the key(name of person)
    // key points to the array within dict to pull a random quote by randomIndex
    // returns them both
// use this, then find it via index.
//    let unSortedCodeKeys = Array(codes.keys)
//    print(unSortedCodeKeys)
//    
//    let sortedCodeKeysAscending = unSortedCodeKeys.sorted(by: <)
//    print(sortedCodeKeysAscending)
    
    func showFact() {
        // returns it in ("Value 1", "Value 2") need to parse these two separately
    }
    
    // TODO:
    // upon click of either portrait:
    // = shows the fact
    // = updates the counter if it was wrong
    // When the random person is received here, correctPerson becomes that and pull the fact with that key
    // When the correct person is tapped and it matches comparison to correctPerson or not, update the score
    // getRandomFact goes into this func
    //        var correctPerson: String = ""
    
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    // Might have to remove the func below and put it back into showFact
    
    func updateCounterShowFact(person: String) {
        switch person {
        case "Bill Gates":
            // remove print after finishing
            print("Lord Gates Was Chosen")
            if selectedPerson == currentAnswer {
                print("Correct Answer")
                currentCorrectCounter += 1
                correctCounter.text = "\(currentCorrectCounter)"
            } else {
                print("Wrong Answer")
                currentWrongCounter += 1
                wrongCounter.text = "\(currentWrongCounter)"
            }
        case "Steve Jobs":
            // remove print after finishing
            print("Lord Jobs Was Chosen")
            if selectedPerson == currentAnswer {
                print("Correct Answer")
                currentCorrectCounter += 1
                correctCounter.text = "\(currentCorrectCounter)"
            } else {
                print("Wrong Answer")
                currentWrongCounter += 1
                wrongCounter.text = "\(currentWrongCounter)"
            }
        default:
            print("You chose poorly")
        }
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
