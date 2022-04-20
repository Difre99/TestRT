//
//  CoinTableViewCell.swift
//  TestRXSwift
//
//  Created by Marco di Fresco on 19/04/22.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var minSizeLabel: UILabel!
    
    static let identifire = "CoinTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var coin: Coin! {
        didSet {
            configureCell()
        }
    }
    
    func configureCell() {
        print("configureCell")
        idLabel.text = coin.id
        nameLabel.text = coin.name
        minSizeLabel.text = coin.min_size
    }
    
}
