//
//  MovieListVC.swift
//  MAD257MovieReview
//
//  Created by Karen Mathes on 3/2/21.
//  Copyright © 2021 TygerMatrix Software. All rights reserved.
//

import UIKit

class MovieListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var movieTableView: UITableView!
    
    //.. array used for movie API info coming back
    var movieArrayTupSorted2: [(xDisplayTitle: String, xMpaaRating: String, xCriticsPick: Int, xByline: String, xHeadline: String, xSummaryShort: String, xUrl: String, xLinkText: String)] = [("","",0,"","","","","")]
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        //..tableView.rowHeight = 40
        movieTableView.rowHeight = 50
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieArrayTupSorted2.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        var cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell1") as! TableViewCell

        if (cell == nil ) {
           //cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
           cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,reuseIdentifier: cellID) as! TableViewCell
           }
          
        //.. note: this already came in sorted from SearchVC.swift
        let mRow = movieArrayTupSorted2[indexPath.row]
        cell.movieTitleLabel.text = mRow.xDisplayTitle

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You tapped cell number \(indexPath.row).")
            self.performSegue(withIdentifier: "movieDetailSegue", sender: indexPath.row)
           
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedRow = sender as? Int
        print("selected row --->>>>> \(selectedRow)")
        
        let mRowSelected = movieArrayTupSorted2[selectedRow ?? 0]
        
        for item in movieArrayTupSorted2 {
            print("#### inside movieArrayTupSorted2 = \(item.xDisplayTitle) - \(item.xSummaryShort), \(item.xUrl), \(item.xLinkText)")
        }
        
        let vc = segue.destination as! MovieDetailVC
        
        vc.displayTitle = mRowSelected.xDisplayTitle
        vc.mpaaRating = mRowSelected.xMpaaRating
        vc.criticsPick = mRowSelected.xCriticsPick
        vc.byline = mRowSelected.xByline
        vc.headline = mRowSelected.xHeadline
        vc.summaryShort = mRowSelected.xSummaryShort
        vc.url = mRowSelected.xUrl
        vc.linkText = mRowSelected.xLinkText
        
    }
    
    

}
