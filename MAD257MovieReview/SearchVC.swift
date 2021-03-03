//
//  SearchVC.swift
//  MAD257MovieReview
//
//  Created by Karen Mathes on 3/2/21.
//  Copyright © 2021 TygerMatrix Software. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet var searchText: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    var mySearchText: String = ""
    
    //.. array used for movie API info coming back
    var movieArrayTup: [(xDisplayTitle: String, xMpaaRating: String, xCriticsPick: Int, xSummaryShort: String)] = [("","",0,"")]
    
    struct Results: Codable {
        
        let displayTitle: String
        let mpaaRating: String
        let criticsPick: Int
        let summaryShort: String
        
        private enum CodingKeys: String, CodingKey {
            case displayTitle = "display_title"        //..map JSON "display_title" to new name displayTitle
            case mpaaRating = "mpaa_rating"          //..map JSON "mpaa_rating" to new name mpaaRating
            case criticsPick = "critics_pick"          //..map JSON "critics_pick" to new name criticsPick
            case summaryShort = "summary_short"   //..map JSON "summary_short" to new name summaryShort
            }
        }

    struct Movie: Codable {
        
        let myResults: [Results]    //..maps to Search Structure above
        
        private enum CodingKeys: String, CodingKey {
            case myResults = "results"       //..map JSON "results" to new name myResults
            
        }
        
    }
        
      
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let vc = segue.destination as! MovieListVC
       
        //.. if the movie names aren't equal, sort on the names asc... if they are equal, sort on the year desc
        let movieArrayTupSorted = movieArrayTup.sorted { $0.0 != $1.0 ? $0.0 < $1.0 : $0.1 > $1.1 }
       
        vc.movieArrayTupSorted2 = movieArrayTupSorted
        //.. you can also call a func instead (ie. vc.kamSetArray(movieArray8) for example
            
    }


    @IBAction func searchButtonPressed(_ sender: Any) {
            self.mySearchText = searchText.text ?? ""
            var _ = queryJSON(query: mySearchText )
    }
    
    //.. to query movie api
    func queryJSON(query: String) {
      
       self.movieArrayTup.removeAll()
        
    //.. Movie JSON example from API
    //    {"status":"OK","copyright":"Copyright (c) 2021 The New York Times Company. All Rights Reserved.","has_more":false,"num_results":1,"results":[{"display_title":"DodgeBall: A True Underdog Story","mpaa_rating":"Unrated","critics_pick":0,"byline":"Stephen Holden","headline":"Loser Nerds vs. Pumped-Up Jocks (Revenge Again?)","summary_short":"Ben Stiller returns to the comedy crime scene to portray a monstrous, pumped-up fitness guru and hilarious variation of Derek Zoolander, the airheaded male model he played with pursed-lipped, vacant-eyed perfection three years (and many dull movies) ago. His new character White Goodman, a preening product of fanatical self-improvement, wears a blow-dry mullet and a Fu Manchu mustache and favors hideous white leisure suits. Affecting the pseudo-macho bark of a drill instructor, he suggests Tony Robbins as a shrimpy, steroid-enhanced gym rat. White and his robotic cronies represent the Goliath  that Peter La Fleur (Vince Vaughn), the slobby, nice guy who owns a nearby low-rent gym, sets out to slay with the help of his nerdy pals who form a dodgeball team to compete for $50,000 first prize in a Las Vegas tournament. The sports comedy is very dumb and often very funny. — Stephen Holden","publication_date":"2004-06-18","opening_date":"2004-06-18","date_updated":"2017-11-02 04:18:03","link":{"type":"article","url":"https://www.nytimes.com/2004/06/18/movies/film-review-loser-nerds-vs-pumped-up-jocks-revenge-again.html","suggested_link_text":"Read the New York Times Review of DodgeBall: A True Underdog Story"},"multimedia":null}]}
        
        
    //        https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=star+wars&api-key=FDCZZDhyl6XVCQzqO06k6gLpdqmFTjHk
            
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nytimes.com"
        components.path = "/svc/movies/v2/reviews/search.json"
//        components.path = "/search.json"
        components.queryItems = [
            URLQueryItem(name: "query", value: query),
//            URLQueryItem(name: "query", value: "star+wars"),
            URLQueryItem(name: "api-key", value: "FDCZZDhyl6XVCQzqO06k6gLpdqmFTjHk")
            //URLQueryItem(name: "s", value: query)//,
        ]
        
        let url = components.url
        print("***** url = \(url)")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                    
            guard let data = data, error == nil else {
                print(error ?? "Unknown error")
                return
            }
            
            //.. prints url data - useful to see movie api string built
            let myResponse = response
            print("\nMy Url Response = \(String(describing: myResponse))")
            
            var h = 0
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(Movie.self, from: data)
                
                for item in responseObject.myResults {
                    
                    let t = item.displayTitle
                    let r = item.mpaaRating
                    let c = item.criticsPick
                    let s = item.summaryShort
                    
                    self.movieArrayTup.append((xDisplayTitle: t, xMpaaRating: r, xCriticsPick: c, xSummaryShort: s))
                    
                    h += 1
                    
                    print("The item retrieved is ===> \(t)")
                }
                
            } catch {
                print("Uh oh, that didn't work :(")
                print(error)
            }
            
            // if you then need to update UI or model objects, dispatch that back
            // to the main queue:
            DispatchQueue.main.async {
                // use `responseObject.data` to update model objects and/or UI here
                
                print("\nIn DispatchQueue -> .....)\n")
                self.searchText.text = ""
                self.performSegue(withIdentifier: "moviesSegue", sender: self)
            }
            
            
        } //.. end of closure
        
        task.resume()
        
    }

            
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
