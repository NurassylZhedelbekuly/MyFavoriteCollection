//
//  SecondViewController.swift
//  SeguesExample
//
//  Created by Adilkhan M on 08.11.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    
    private var inputModel: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = inputModel?.title
        descriptionLabel.text = inputModel?.description
        coverImage.image = inputModel?.image
        yearLabel.text = inputModel?.year
    }

    func configure(with model: Movie?) {
        self.inputModel = model
    }
}
