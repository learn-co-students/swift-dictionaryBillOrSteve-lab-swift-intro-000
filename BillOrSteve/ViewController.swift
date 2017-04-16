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
  let BILL_GATES = "Bill Gates"
  let STEVE_JOBS = "Steve Jobs"
  
  var factsBillAndSteve: [String: [String]] = [:]
  var correctPerson: String = ""
  var totalScore: Int = 0
  var totalRounds: Int = 0

  @IBOutlet weak var factLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  
  // MARK: -
  @IBAction func buttonTapped(_ sender: UIButton) {
    if (sender.titleLabel?.text == "bill" && correctPerson == BILL_GATES) ||
       (sender.titleLabel?.text == "steve" && correctPerson == STEVE_JOBS) {
      totalScore += 1
    }

    totalRounds += 1
    scoreLabel.text = String("\(totalRounds)/\(totalScore)")
    
    showFact()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createFacts()
    
    showFact()
  }
  
  func getRandomFact() -> (String, String) {
    let person = randomPerson()
    
    if let facts = factsBillAndSteve[person] {
      let fact = produceFact(from: facts, with: person)
      return (person, fact)
    }
    
    let otherPerson = person == "Bill Gates" ? "Steve Jobs" : "Bill Gates"
    
    if let facts = factsBillAndSteve[otherPerson] {
      let fact = produceFact(from: facts, with: otherPerson)
      return (otherPerson, fact)
    }
    
    view.isUserInteractionEnabled = false
    return ("", "GAME OVER")
  }

  func produceFact(from array: [String], with person: String) -> String {
    var copy = array
    let index = randomIndex(fromArray: copy)
    let fact = copy[index]
    copy.remove(at: index)
    factsBillAndSteve[person] = copy.isEmpty ? nil : copy
    return fact
  }
  
  
  
  // MARK: - Facts
  
  func createFacts() {
    let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                     "He scored 1590 (out of 1600) on his SATs.",
                     "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                     "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                     "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
    let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                      "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                      "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                      "He was a pescetarian, meaning he ate no meat except for fish."
    ]
    
    factsBillAndSteve[BILL_GATES] = billFacts
    factsBillAndSteve[STEVE_JOBS] = steveFacts
  }
  
  // Show fact randomly
  func showFact() {
    let (person, fact) = getRandomFact()
    
    factLabel.text = fact
    correctPerson = person
  }

  
  // MARK: - Helper Functions
  func randomIndex(fromArray array: [String]) -> Int {
    return Int(arc4random_uniform(UInt32(array.count)))
  }
  
  func randomPerson() -> String {
    let randomNumber = arc4random_uniform(2)
    
    if randomNumber == 0 {
      return STEVE_JOBS
    } else {
      return BILL_GATES
    }
  }
  
  
}
