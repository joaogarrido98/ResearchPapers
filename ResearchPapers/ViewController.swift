//
//  ViewController.swift
//  ResearchPapers
//
//  Created by Joao Garrido on 22/11/2021.
//

import UIKit

class ViewController: UIViewController {
    var titles : String?
    var year : String?
    var authors : String?
    var email : String?
    var abstract : String?
    var url : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titles
        yearLabel.text = year
        authorsLabel.text = authors
        emailLabel.text = email
        abstractLabel.text = abstract
        if(url != nil){
            let attributedString = NSMutableAttributedString(string: url!.absoluteString)
            urlLabel.attributedText = attributedString
        }
    }


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var urlLabel: UITextView!
}

