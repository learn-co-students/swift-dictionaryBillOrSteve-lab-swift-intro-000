//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var correctPerson: String = ""
    var counter: Int = 0
    
    
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    @IBAction func clickedSteve(_ sender: UIButton) {
        if correctPerson == "Steve Jobs" {
            counter += 1
            scoreCounter.text = String(counter)
            showToast(message: "Correct Answer!")
        } else {
            showToast(message: "Incorrect Answer!")
        }
        showFact()
        
    }
    
    @IBAction func clickedBill(_ sender: UIButton) {
        if correctPerson == "Bill Gates" {
            counter += 1
            scoreCounter.text = String(counter)
            showToast(message: "Correct Answer!")
        } else {
            showToast(message: "Incorrect Answer!")
        }
        showFact()
    }
    
    // Create your stored properties here
    
    var billAndSteveFacts: [String: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    
    func createFacts() {
        
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
        "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
        
    }
    
    
    func getRandomFact() -> (String, String) {
        
        let personFact = randomPerson()
        let factIndex = randomIndex(fromArray: billAndSteveFacts[personFact]!)
        let factPerson = billAndSteveFacts[personFact]
        
        let fact = factPerson?[factIndex]
        print("Person: \(personFact) \n Fact: \(fact!)")
        removeFact(person: personFact, index: factIndex)
        print("Object: \(billAndSteveFacts)")
        return (personFact,fact!)
        
        
    }
    
    func showFact() {
        
        let randomFact = getRandomFact()
        correctPerson = randomFact.0
        randomFactLabel.text = randomFact.1
        
    }
    
    func removeFact(person: String, index: Int) {
        var newArray = billAndSteveFacts[person]
        newArray?.remove(at: index)
        
        billAndSteveFacts[person] = newArray
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

extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-300, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    } }
