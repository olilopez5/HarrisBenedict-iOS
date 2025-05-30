//
//  ResultViewCell.swift
//  HarrisBenedict-iOS
//
//  Created by Mañanas on 30/5/25.
//

import UIKit

class ResultViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    func render(title: String, result: String) {
        titleLabel.text = title
        resultLabel.text = result
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
