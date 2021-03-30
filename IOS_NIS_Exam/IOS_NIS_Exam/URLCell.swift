//
//  URLCell.swift
//  IOS_NIS_Exam
//
//  Created by Egor Dadugin on 30.03.2021.
//

import UIKit

protocol URLCellDelegate : class {
    func didLikeButtonPressed(cell: URLCell)
}

class URLCell: UICollectionViewCell {
    var delegate: URLCellDelegate?

    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var likedButton: UIButton!
    @IBAction func likedButtonAction(_ sender: Any) {
        delegate?.didLikeButtonPressed(cell: self)
    }
}
