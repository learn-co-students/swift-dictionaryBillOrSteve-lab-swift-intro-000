//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var factView: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var incorrectView: UIImageView!
    // Create your stored properties here
    var storedFacts: [String : [String]] = [:]
    var correctPerson: String = ""
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        count = 0
    }
    
    func initialize(){
        createFacts()
        showFact()
        incorrectView.alpha = 0
    }
    
    func createFacts() {
        if storedFacts.isEmpty{
            let billFacts: [String] = [
                "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                "He scored 1590 (out of 1600) on his SATs.",
                "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
            ]
            let steveFacts: [String] = [
                "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                "He was a pescetarian, meaning he ate no meat except for fish."
            ]
            
            storedFacts["Bill Gates"] = billFacts
            storedFacts["Steve Jobs"] = steveFacts
        }
    }
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        guard var personFacts = storedFacts[person] else{
            return (person, "No fact found")
        }
        
        let factIndex = randomIndex(fromArray: personFacts)
        storedFacts[person]?.remove(at: factIndex)
        
        return (person, personFacts[factIndex])
    }
    
    func showFact() {
        let currentFact = getRandomFact()
  
        factView.text = currentFact.1
        correctPerson = currentFact.0
    }
    
    func checkGuess(sender: String){
        if sender == correctPerson{
            count += 1
            scoreCounter.text = "\(count)"
            showFact()
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.incorrectView.alpha = 1
            }) { _ in
                UIView.animate(withDuration: 1, animations:{
                    self.incorrectView.alpha = 0
                    self.showFact()
                })
            }
        }
        
        if count == 9{
            let alert = UIAlertController(title: "Game Over", message: "Total correct: \(count) / 9. Would you like to play again?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.initialize()
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
                UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func billSelect(_ sender: UIButton) {
        if let titleLabel = sender.titleLabel {
            if let title = titleLabel.text{
                checkGuess(sender: title)
            }
        }
    }
    
    @IBAction func steveSelect(_ sender: UIButton) {
        if let titleLabel = sender.titleLabel {
            if let title = titleLabel.text{
                checkGuess(sender: title)
            }
        }
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
