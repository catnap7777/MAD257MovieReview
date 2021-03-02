//
//  ViewController.swift
//  MAD257MovieReview
//
//  Created by Karen Mathes on 3/1/21.
//  Copyright © 2021 TygerMatrix Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var shortSummaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=star+wars&api-key=FDCZZDhyl6XVCQzqO06k6gLpdqmFTjHk
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nytimes.com/svc/movies/v2/reviews/search.json?"
        components.queryItems = [
            URLQueryItem(name: "query", value: "star wars"),
            URLQueryItem(name: "apikey", value: "FDCZZDhyl6XVCQzqO06k6gLpdqmFTjHk")
            //URLQueryItem(name: "s", value: query)//,
        ]
        
        let url = components.url
        print("***** url = \(url)")
        
//        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334") {
//
//            if let data = NSData(contentsOf: url as URL) {
//
//                do {
//                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
//
//                    let newDict = parsed
//
//                    print(newDict["currently"]!["summary"] as Any)
//                    print(newDict["currently"]!["temperature"] as Any)
//                    print(newDict["currently"]!["dewpoint"] as Any)
//
//                    self.currentTemp.text = "\(String(describing: newDict["currently"]!["temperature"]!!))"
//                    self.currentSummary.text = "\(String(describing: newDict["currently"]!["summary"]!!))"
//                    self.currentDewPoint.text = "\(String(describing: newDict["currently"]!["dewPoint"]!!))"
//
//                } catch let error as NSError {
//                    print("A JSON parsing error occurred. Here are the details:\n \(error)")
//                }
//
//            } //.. end if
//
//        } //.. end closure
    }


}

