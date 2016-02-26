//
//  NumberOfPeopleCell.swift
//  UHome
//
//  Created by wjl on 16/2/25.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class NumberOfPeopleCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    private var buyNumber: Int = 0 {
        willSet {
            numberLabel.text = "\(newValue)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        minusButton.addTarget(self, action: "minusNumberOfPeople", forControlEvents: .TouchUpInside)
        plusButton.addTarget(self, action: "addNumberOfPeople", forControlEvents: .TouchUpInside)
    }
    
    func addNumberOfPeople(){
        buyNumber++;
        NSNotificationCenter.defaultCenter().postNotificationName(changeNumberOfPeopleNotification, object: nil)
    }
    
    func minusNumberOfPeople(){
        buyNumber--;
        NSNotificationCenter.defaultCenter().postNotificationName(changeNumberOfPeopleNotification, object: nil)
    }
    
    
    

    
}
