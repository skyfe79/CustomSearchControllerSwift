//
//  ViewController.swift
//  CustomSearchController
//
//  Created by Julien Hoachuck on 8/19/15.
//  Copyright (c) 2015 Pandodroid. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    
    var items: [String] = ["HTC", "iPhone", "Samsung", "LG", "Nexus", "Windows"]
    var searchItems: [String] = ["HTC", "iPhone", "Samsung", "Nexus", "Windows"]
    
    // Custom search Controller
    var itemSearchController = CustomSearchController(searchViewController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate  = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.itemSearchController.searchResultsUpdater = self
        self.itemSearchController.hidesNavigationBarDuringPresentation = false
        self.itemSearchController.dimsBackgroundDuringPresentation = false
        self.itemSearchController.definesPresentationContext = true
        
        self.itemSearchController.searchBar.sizeToFit()
        self.itemSearchController.searchBar.barTintColor = UIColor.clearColor()
        self.itemSearchController.searchBar.backgroundImage = UIImage()
        self.itemSearchController.searchBar.setImage(UIImage(named: "blank"), forSearchBarIcon: .Search, state: .Normal)
        
        //self.itemSearchController.searchBar.searchTextPositionAdjustment = UIOffsetMake(-19,0)
        self.itemSearchController.searchBar.placeholder = "Enter Search Word"
        self.navigationItem.titleView = self.itemSearchController.searchBar
        self.itemSearchController.hidesNavigationBarDuringPresentation = false
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        self.itemSearchController.searchBar.setNeedsDisplay()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
        
        self.itemSearchController.searchBar.frame = CGRectMake(0, 0, 1024, 100)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK:- UISearchResultsUpdating
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.searchItems.removeAll(keepCapacity: false)
        
        if let text = searchController.searchBar.text {
            let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", text)
            let array = (self.items as NSArray).filteredArrayUsingPredicate(searchPredicate)
            self.searchItems = array as! [String]
            self.tableView.reloadData()
        }
    }


    
    //MARK:- UITableViewDelegate/DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if(self.itemSearchController.active)
        {
            return self.searchItems.count
        }
        else
        {
            return self.items.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        if (self.itemSearchController.active) {
            cell.textLabel?.text = self.searchItems[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = self.items[indexPath.row]
            return cell
        }
    }

}

