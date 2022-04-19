//
//  CustomTableViewCell.swift
//  Myplaces
//
//  Created by user on 19/04/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var imageOfPlace: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
