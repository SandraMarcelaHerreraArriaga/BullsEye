//
//  ViewController.swift
//  BullsEye
//
//  Created by Sandra Herrera on 9/14/19.
//  Copyright © 2019 Sandra Herrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    override func viewDidLoad() {
        super.viewDidLoad()
        changeTargetValue()
    }

    
    func changeTargetValue()
    {
        targetValue = Int.random(in: 1...100)
        targetLabel.text = String(targetValue)
    }
    
    
    func showAlert(title : String, message: String)
    {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(action)
        present(alertVC,animated: true, completion: nil)
    
    }

    @IBAction func sliderChanged(_ slider: UISlider)
    {
        currentValue = Int(slider.value.rounded())
        print("\(slider.value)")
    }
    
    @IBAction func hitMeTappead(_ sender: Any)
    {
      print("you tapped me")
        let difference   = abs(targetValue - currentValue)
        let points : Int
        switch difference {
        case 0:
            points = 200
        case 1:
            points = difference + 50

        default:
            points = difference
        }
        
        //showAlert(title: "Alerta", message: "Obtuviste  \(points) puntos")
        let alertVC = UIAlertController(title: "Alerta", message: "Obtuviste  \(points) puntos", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: {alert in
            //_ in trailling clousure
            
            self.score += points
            self.scoreLabel.text = String(self.score)
            
        })
        alertVC.addAction(action)
        present(alertVC,animated: true, completion: nil)
        
    }
    
    
    @IBAction func resetButton(_ sender: Any)
    {
        
    }
}



