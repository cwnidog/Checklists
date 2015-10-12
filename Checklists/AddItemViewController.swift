//
//  AddItemViewController.swift
//  Checklists
//
//  Created by John Leonard on 10/3/15.
//  Copyright © 2015 John Leonard. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class
{
  func addItemViewControllerDidCancel(controller: AddItemViewController)
  func addItemViewController(controller: AddItemViewController, didFinishAddingItem item: ChecklistItem)
  func addItemViewController(controller: AddItemViewController, didFinishEditingItem item: ChecklistItem)

} // protocol AddItemViewControllerDelegate

class AddItemViewController: UITableViewController, UITextFieldDelegate
{
  @IBAction func cancel()
  {
    delegate?.addItemViewControllerDidCancel(self)
  } // cancel()
  
  @IBAction func done()
  {
    if let item = itemToEdit
    {
      item.text = textField.text!
      delegate?.addItemViewController(self, didFinishEditingItem: item)
    }
    
    else
    {
      let item = ChecklistItem()
      item.text = textField.text!
      item.checked = false
      delegate?.addItemViewController(self, didFinishAddingItem: item)
    }
  } // done()
  
  @IBOutlet weak var textField: UITextField!
  
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  weak var delegate: AddItemViewControllerDelegate?
  
  var itemToEdit: ChecklistItem?
  
  override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath?
  {
    return nil
  } // tableView willSelectRowAtIndexPath
  
  override func viewWillAppear(animated: Bool)
  {
    super.viewWillAppear(animated)
    textField.becomeFirstResponder()
  } // viewWillAppear()
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    if let item = itemToEdit
    {
      title = "Edit Item"
      textField.text = item.text
      doneBarButton.enabled = true
    }
  } // viewDidLoad
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
                 replacementString string: String) -> Bool
  {
    let oldTtext: NSString = textField.text!
    let newText: NSString = oldTtext.stringByReplacingCharactersInRange(range, withString: string)
    
    doneBarButton.enabled = (newText.length > 0)
    return true
  } // textField shouldChangeCharactersInRange
  
  
} // class AddItemViewController
