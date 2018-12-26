//
//  NoteTableViewCell.swift
//  Note
//
//  Created by Lilianna Kinakh on 11/25/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        leftImageView.layer.cornerRadius = leftImageView.frame.height / 2
        leftImageView.layer.backgroundColor = UIColor.red.cgColor
        leftImageView.clipsToBounds = true
        
    }
    

    @IBAction func starFavorite(_ sender: Any) {
//        if starButton.isTouchInside == true {
//            starButton.backgroundColor = .red
//        }else{
//            starButton.backgroundColor = .blue
//        }
    }
}
