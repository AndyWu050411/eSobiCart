//
//  OptionCollectionViewCell.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/10.
//

import UIKit

class OptionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var optionLabel: UILabel!
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        contentView.layer.borderWidth = 1
    }
    func configureCell(text: String, isSelect: Bool) {
        optionLabel.text = text
        contentView.layer.borderColor = isSelect ? UIColor.label.cgColor : UIColor.systemGray.cgColor
    }
    func configureCell(isSelect: Bool) {
        contentView.layer.borderColor = isSelect ? UIColor.label.cgColor : UIColor.systemGray.cgColor
    }
}
