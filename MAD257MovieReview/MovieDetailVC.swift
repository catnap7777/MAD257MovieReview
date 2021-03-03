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
    @IBOutlet var shortSummaryLabel: UILabel!
    
    var displayTitle = ""
    var mpaaRating = ""
    var criticsPick = 0
    var summaryShort = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if criticsPick == 0 {
            criticsPickLabel.text = "Not A Critics Pick"
        } else {
            criticsPickLabel.text = "*** Critics Pick ***"
        }
        
        movieTitleLabel.text = displayTitle
        mpaaRatingLabel.text = mpaaRating
        shortSummaryLabel.text = summaryShort
    }


    
}
