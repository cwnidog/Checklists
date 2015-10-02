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
  
  // how many rows are there?
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return 100
  } // tableView numberOfRowsInSection
  
  // fill in cell label values, based on cell number
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
  } // tableView cellForRowAtIndexPath
  
  // toggle the checkmark on & off
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    if let cell = tableView.cellForRowAtIndexPath(indexPath)
    {
      if cell.accessoryType == .None
      {
        cell.accessoryType = .Checkmark
      }
      else
      {
        cell.accessoryType = .None
      }
    } // if let cell
    
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
  } // tableView didSelectRowAtIndexPath
  
} // class ChecklistViewController

