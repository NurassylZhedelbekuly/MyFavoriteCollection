//
//  PrimaryTableViewCell.swift
//  SeguesExample
//
//  Created by Adilkhan M on 08.11.2024.
//

import UIKit

class PrimaryTableViewCell: UITableViewCell {

    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ model: Movie) {
        titleLabel.text = model.title
        coverImage.image = model.image
    }

}
