//
//  ViewController.swift
//  Checklists
//
//  Created by John Leonard on 10/2/15.
//  Copyright © 2015 John Leonard. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate
{
  var items: [ChecklistItem]
  
  required init?(coder aDecoder: NSCoder)
  {
    items = [ChecklistItem]()

    let row0item = ChecklistItem()
    row0item.text = "Walk the dog"
    row0item.checked = false
    items.append(row0item)
    
    let row1item = ChecklistItem()
    row1item.text = "Brush my teeth"
    row1item.checked = true
    items.append(row1item)
    
    let row2item = ChecklistItem()
    row2item.text = "Learn iOS development"
    row2item.checked = true
    items.append(row2item)
    
    let row3item = ChecklistItem()
    row3item.text = "Soccer practice"
    row3item.checked = false
    items.append(row3item)
    
    let row4item = ChecklistItem()
    row4item.text = "Eat ice cream"
    row4item.checked = true
    items.append(row4item)
    
    let row5item = ChecklistItem()
    row5item.text = "Spin around in circles"
    row5item.checked = true
    items.append(row5item)
    
    let row6item = ChecklistItem()
    row6item.text = "Throw the ball for Boris"
    row6item.checked = true
    items.append(row6item)
    
    super.init(coder: aDecoder)
  }

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
    return items.count
  } // tableView numberOfRowsInSection
  
  // fill in cell label values, based on cell number
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
    let item = items[indexPath.row]
    
    configureTextForCell(cell, withChecklistItem: item)
    configureCheckmarkForCell(cell, withChecklistItem: item)
    return cell
  } // tableView cellForRowAtIndexPath
  
  // toggle the checkmark on & off
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    if let cell = tableView.cellForRowAtIndexPath(indexPath)
    {
      let item = items[indexPath.row]
      item.toggleChecked()
      
      configureCheckmarkForCell(cell, withChecklistItem: item)
    } // if let cell
    
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
  } // tableView didSelectRowAtIndexPath
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
  {
    // 1
    items.removeAtIndex(indexPath.row)
    
    // 2
    let indexPaths = [indexPath]
    tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    
  } // tableView commitEditingStyle forRowAtIndexPath
  
  func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem)
  {
    let label = cell.viewWithTag(1001) as! UILabel
    if item.checked
    {
      label.text = "√"
    }
    else
    {
      label.text = ""
    }
    
  } // configureCheckmarkForCell()
  
  func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem)
  {
    let label = cell.viewWithTag(1000) as! UILabel
    label.text = item.text
  } // configureTextForCell withChecklistItem
  
 
  func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
  {
    dismissViewControllerAnimated(true, completion: nil)
  } // itemDetailViewControllerDidCancel()
  
  func itemDetailViewController(controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
  {
    if let index = items.indexOf(item)
    {
      let indexPath = NSIndexPath(forRow: index, inSection: 0)
      
      if let cell = tableView.cellForRowAtIndexPath(indexPath)
      {
        configureTextForCell(cell, withChecklistItem: item)
      }
    }
    dismissViewControllerAnimated(true, completion: nil)
  } // itemDetailViewController didFinishEditingItem
  
  func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
  {
    let newRowIndex = items.count
    items.append(item)
    
    let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
    let indexPaths = [indexPath]
    tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    
    dismissViewControllerAnimated(true, completion: nil)
  } // itemDetailViewController didFinishAddingItem
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
  {
    if segue.identifier == "AddItem"
    {
      let navigationController = segue.destinationViewController as! UINavigationController
      let controller = navigationController.topViewController as! ItemDetailViewController
      
      controller.delegate = self
    } // if identifier == AddItem
    
    else if segue.identifier == "EditItem"
    {
      let navigationController = segue.destinationViewController as! UINavigationController
      let controller = navigationController.topViewController as! ItemDetailViewController
      controller.delegate = self
      
      if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
      {
        controller.itemToEdit = items[indexPath.row]
      }
    } // if identifier == EditItem
  } // prepareForSegue()
  
} // class ChecklistViewController

