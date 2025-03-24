//
//  TableViewCell.swift
//  MaxStrenght
//
//  Created by MacMini6 on 24/03/25.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelAttempt: UILabel!
    @IBOutlet weak var txtKg: UITextField!
    @IBOutlet weak var thumpsDown: UIImageView!
    @IBOutlet weak var thumpsUp: UIImageView!
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   
    }
 
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        
    }
    
}
