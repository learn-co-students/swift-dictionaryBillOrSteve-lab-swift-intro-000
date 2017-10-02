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
    var factsDic = [String: [String]]();
    var currentPerson = "";
    var currentScore = 0;
    var currentGuess = 0;
    var steveFacts = [String]();
    var billFacts = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts();
        showFact();
        counterLabel.text = ""
    }
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    @IBAction func stevePressed(_ sender: AnyObject) {
        if(currentPerson != "game over") {
        if(currentPerson == "Steve Jobs") {
            currentScore += 1;
        }
        currentGuess += 1;
        counterLabel.text = "\(currentScore)/\(currentGuess)";
        }
        showFact();
    }
    
    @IBAction func billPressed(_ sender: AnyObject) {
        if(currentPerson != "game over") {
        if(currentPerson == "Bill Gates") {
            currentScore += 1;
        }
        currentGuess += 1;
        counterLabel.text = "\(currentScore)/\(currentGuess)";
        }
        showFact();
    }
    
    func showFact() {
        let factInfo = getRandomFact();
        
        currentPerson = factInfo.0;
        factLabel.text = factInfo.1;
        
    }
    
    func createFacts() {
        steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."];
        billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."];
        
        factsDic["Steve Jobs"] = steveFacts;
        factsDic["Bill Gates"] = billFacts;
    }
    
    func getRandomFact() -> (String, String) {
        var person = randomPerson();
        if(steveFacts.count == 0 && billFacts.count == 0) {
            return ("game over", "Game Over");
        }
        if(steveFacts.count == 0 || billFacts.count == 0) {
            if(steveFacts.count == 0 && billFacts.count > 0) {
                person = "Bill Gates"
            } else {
                person = "Steve Jobs";
            }
        }
        let index = randomIndex(fromArray: factsDic[person]!);
        let fact = factsDic[person]![index];
        if(person == "Steve Jobs") {
            steveFacts.remove(at: index)
            factsDic["Steve Jobs"] = steveFacts;
        } else {
            billFacts.remove(at: index)
            factsDic["Bill Gates"] = billFacts;
        }
        
        return (person, fact);
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
