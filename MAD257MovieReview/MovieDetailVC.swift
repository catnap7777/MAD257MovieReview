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
    @IBOutlet var summaryShortTextView: UITextView!
    @IBOutlet var reviewDescLabel: UILabel!
    @IBOutlet var urlLabel: UILabel!
    
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

        //print("summaryShort passed in = \(summaryShort)")
        
//        https://www.hackingwithswift.com/example-code/strings/replacing-text-in-a-string-using-replacingoccurrencesof
        let summaryShortReplaced = summaryShort.replacingOccurrences(of: "&quot;", with: "\"")
        //print("summaryShortReplaced ===== \(summaryShortReplaced)")
        
        if criticsPick == 0 {
            criticsPickLabel.text = "Not a Critic Pick"
        } else {
            criticsPickLabel.text = "*** Critic Pick ***"
        }
        
        summaryShortTextView.isSelectable = true
        summaryShortTextView.isScrollEnabled = true
        summaryShortTextView.showsVerticalScrollIndicator = true
        summaryShortTextView.isUserInteractionEnabled = true
        summaryShortTextView.becomeFirstResponder()
        summaryShortTextView.bounces = true
        summaryShortTextView.panGestureRecognizer.allowedTouchTypes = [NSNumber(value: UITouch.TouchType.indirect.rawValue)]
        
        movieTitleLabel.text = displayTitle
        mpaaRatingLabel.text = mpaaRating
        summaryShortTextView.text = summaryShortReplaced
        bylineLabel.text = byline
        headlineLabel.text = headline
        reviewDescLabel.text = linkText
        urlLabel.text = url
        
        
    }
    
    
    
    
}
