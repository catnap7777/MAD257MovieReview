//
//  MovieDetailVC.swift
//  MAD257MovieReview
//
//  Created by Karen Mathes on 3/2/21.
//  Copyright © 2021 TygerMatrix Software. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var mpaaRatingLabel: UILabel!
    @IBOutlet var criticsPickLabel: UILabel!
    @IBOutlet var bylineLabel: UILabel!
    @IBOutlet var headlineLabel: UILabel!
    @IBOutlet var summaryShortLabel: UILabel!
    
    var displayTitle = ""
    var mpaaRating = ""
    var criticsPick = 0
    var byline = ""
    var headline = ""
    var summaryShort = ""
    var url = ""
    var linkText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("summaryShort passed in = \(summaryShort)")
        
        
        if criticsPick == 0 {
            criticsPickLabel.text = "Not a Critic Pick"
        } else {
            criticsPickLabel.text = "*** Critic Pick ***"
        }
        movieTitleLabel.text = displayTitle
        mpaaRatingLabel.text = mpaaRating
        summaryShortLabel.text = summaryShort
        bylineLabel.text = byline
        headlineLabel.text = headline
    }


    
}
