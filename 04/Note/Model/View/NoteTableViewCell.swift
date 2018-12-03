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
  
    override func awakeFromNib() {
        super.awakeFromNib()

        leftImageView.layer.cornerRadius = leftImageView.frame.height / 2
        leftImageView.layer.backgroundColor = UIColor.red.cgColor
        leftImageView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupWith(note: Note) {
        titleLabel.text = note.title
        leftImageView.image = note.image
        
    }
    
}
