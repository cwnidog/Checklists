//
//  ViewController.swift
//  Checklists
//
//  Created by John Leonard on 10/2/15.
//  Copyright © 2015 John Leonard. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController
{

  override func viewDidLoad()
  {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  } // viewDidLoad()

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  } // didReceiveMemoryWarning
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return 100
  } // tableView()
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
    
    let label = cell.viewWithTag(1000) as! UILabel
  
    if indexPath.row % 5 == 0
    {
      label.text = "Walk the dog"
    }
    else if indexPath.row % 5 == 1
    {
      label.text = "Brush my teeth"
    }
    else if indexPath.row % 5 == 2
    {
      label.text = "Learn iOS development"
    }
    else if indexPath.row % 5 == 3
    {
      label.text = "Soccer practice"
    }
    else if indexPath.row % 5 == 4
    {
      label.text = "Eat ice cream"
    }
    
    return cell
  } // tableView()
  
} // class ChecklistViewController

