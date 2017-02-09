//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var factLabel : UILabel!
    @IBOutlet weak var counterLabel : UILabel!
    @IBOutlet weak var billButton : UIButton!
    @IBOutlet weak var steveButton : UIButton!
    
    
    // Create your stored properties here
    var billAndSteveFacts: [String : [String]] = [:]
    var billorsteve: String = "Steve Jobs"
    var factindex: Int = 0
    var correctPerson: String = "Steve Jobs"
    var array_fact : (String,String) = ("","")
    var counter : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        factLabel.text = "He took a caligraphy course..."
        createFacts()
    }
    
    
    
    func createFacts() {
        let billFacts = ["BILLCheese", "BILLMore Cheese"]
        let steveFacts = ["STEVENo Cheese", "STEVEMilk"]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
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
    
    func getRandomFact() -> (String, String) {
        
        // implement your function here
        billorsteve = randomPerson()
        var billorsteveArray : [String] = [""]
        
        //unwrap Dictionary array
        if let(billorstevearray) = billAndSteveFacts[billorsteve]{
            billorsteveArray = billorstevearray
        }
        
        factindex = randomIndex(fromArray: billorsteveArray) //Hmm
        return (billorsteve, billorsteveArray[factindex])
    }
    
    func showFact() {
        array_fact = getRandomFact()
        
        correctPerson =  array_fact.0
        factLabel.text = array_fact.1
    }
    
    
    @IBAction func chooseFactSteve(_ sender: UIButton) {
        if correctPerson == "Steve Jobs"{
            counter = counter + 1
        }
        //counter = counter + 1
        counterLabel.text = "\(counter)"
        showFact()
    }
    
    @IBAction func chooseFactBill(_ sender: UIButton) {
        if correctPerson == "Bill Gates"{
            counter = counter + 1
        }
        //counter = counter + 1
        counterLabel.text = "\(counter)"
        showFact()
    }

}
