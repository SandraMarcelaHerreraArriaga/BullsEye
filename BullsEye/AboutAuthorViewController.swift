//
//  AboutAuthorViewController.swift
//  BullsEye
//
//  Created by Sandra Herrera on 11/14/19.
//  Copyright © 2019 Sandra Herrera. All rights reserved.
//

import UIKit

class AboutAuthorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
