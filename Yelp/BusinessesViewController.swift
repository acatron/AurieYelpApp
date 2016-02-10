//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  var businesses: [Business]!
  
  var filteredBusinesses : [Business]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 120
    
    let searchBar = UISearchBar()
    searchBar.sizeToFit()
    searchBar.delegate = self
    
    navigationItem.titleView = searchBar
    
    
    Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
      self.businesses = businesses
      self.filteredBusinesses = businesses
      self.tableView.reloadData()
      
      for business in businesses {
        print(business.name!)
        print(business.address!)
      }
    })
    
    /* Example of Yelp search with more search options specified
    Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
    self.businesses = businesses
    
    for business in businesses {
    print(business.name!)
    print(business.address!)
    }
    }
    */
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if filteredBusinesses != nil{
      return filteredBusinesses.count
    }
    return 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
    
    cell.business = filteredBusinesses[indexPath.row]
    
    return cell
  }
  
  func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    if(searchText.isEmpty){
      filteredBusinesses = businesses
    }
    else{
      filteredBusinesses = businesses.filter({(dataItem: Business) -> Bool in
        // If dataItem matches the searchText, return true to include it
        if dataItem.name!.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil {
          return true
        } else {
          return false
        }
      })
    }
    tableView.reloadData()
    }
}


