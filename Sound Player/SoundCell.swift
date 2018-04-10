//
//  SoundCell.swift
//  Sound Player
//
//  Created by Ahmed Hazzaa  on 4/10/18.
//  Copyright © 2018 Ahmed Hazzaa . All rights reserved.
//

import UIKit

class SoundCell: UITableViewCell {

    @IBOutlet weak var soundImageView: UIImageView!
    
    @IBOutlet weak var soundLabel: UILabel!
    
    func setSoundCell(sound: Sound){
        soundImageView.image = sound.image
        soundLabel.text = sound.title
    }
    
}
