//
//  NoteCollectionViewCell.swift
//  Note
//
//  Created by Lilianna Kinakh on 11/30/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class NoteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
        leftImageView.layer.cornerRadius = leftImageView.frame.height / 2
        leftImageView.layer.backgroundColor = UIColor.red.cgColor
        leftImageView.clipsToBounds = true
    }

    func setupWith(note: Note) {
        titleLabel.text = note.title
        textLabel.text = note.text
    }
    
}
