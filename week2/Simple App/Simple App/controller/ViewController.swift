//
//  ViewController.swift
//  Simple App
//
//  Created by TSAI TSUNG-HAN on 2021/3/4.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleLable: UILabel!
    
    @IBAction func button(_ sender: Any) {
        self.view.backgroundColor = colorSet[Int.random(in: 0...6)]
        middleLable.text = text[Int.random(in: 0...6)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.3203935325, green: 0.7338063121, blue: 0.7922449708, alpha: 1)

    }


}

