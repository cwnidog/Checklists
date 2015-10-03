//
//  ChecklistItem.swift
//  Checklists
//
//  Created by John Leonard on 10/2/15.
//  Copyright © 2015 John Leonard. All rights reserved.
//

import Foundation

class ChecklistItem
{
  var text = ""
  var checked = false
  
  func toggleChecked()
  {
    checked = !checked
  }
  
} // class ChecklistItem