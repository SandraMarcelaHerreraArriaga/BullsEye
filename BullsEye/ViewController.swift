//
//  ViewController.swift
//  BullsEye
//
//  Created by Sandra Herrera on 9/14/19.
//  Copyright © 2019 Sandra Herrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundValue: UILabel!
    //weak
    
    var currentValue = 50
    //store property
    //computing property
    //getter setter
    //lazy properties
    //Garbage Collection java
    //retain cycle
    //[weak self] alert in - es otra forma solo que despues de self va el ? dentro del clousure
    
    var targetValue = 0
    var score = 0
    var round = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        roundValue.text = String(round)
        currentValue = Int(roundedValue)
        changeTargetValue()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        let trackRighttImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRighttResizeable = trackRighttImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRighttResizeable, for: .normal)
    }

    
    func changeTargetValue()
    {
        targetValue = Int.random(in: 1...100)
        targetLabel.text = String(targetValue)
    }
    
    
    func showAlert(points : Int, difference : Int)
    {
        let message = "Your score: \(points)"
        let alertVC = UIAlertController(title: titleAlert(difference: difference), message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler:  {alert in
            //_ in trailling clousure
            
            //self.score += points
            //self.scoreLabel.text = String(self.score)
            //self.roundValue.text = String(self.round)
            self.startNewRound()
        })
        alertVC.addAction(action)
        present(alertVC,animated: true, completion: nil)
        
        
    
    }

    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels()
    {
        targetLabel.text = String(targetValue)
        self.roundValue.text = String(self.round)
    }
    func titleAlert(difference : Int) -> String {
     
        if difference == 0 {
            return "Perfect"
        } else if difference < 5 {
            return "You almost had it"
        } else if difference < 10 {
            return "Pretty Good"
        }
        else {
            return "Not even close."
        }
       
    }
    
    @IBAction func sliderChanged(_ slider: UISlider)
    {
        scoreLabel.text = String(score)
        currentValue = Int(slider.value.rounded())
        roundValue.text = String(round)
        print("\(slider.value)")
    }
    
    @IBAction func hitMeTappead(_ sender: Any)
    {
        let difference = abs(targetValue - currentValue)
        var points  = 100 - difference
        if difference == 0 {
            points += 100
        } else if difference == 5{
            points += 50
        }
        self.score += points
        self.scoreLabel.text = String(self.score)
        self.roundValue.text = String(self.round)
        
        showAlert(points: points, difference: difference)
    }
    
    
    @IBAction func resetButton(_ sender: Any)
    {
        newGame()
    }
    
    @IBAction func informationAuthor(_ sender: UIButton) {
    
        performSegue(withIdentifier: "infoAuthor", sender: self)
    }
    func newGame(){
        score = 0
        round = 0
        startNewRound()
    }
}



