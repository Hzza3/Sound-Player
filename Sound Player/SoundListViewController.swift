//
//  SoundListViewController.swift
//  Sound Player
//
//  Created by Ahmed Hazzaa  on 4/10/18.
//  Copyright © 2018 Ahmed Hazzaa . All rights reserved.
//

import UIKit

class SoundListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var Sounds: [Sound] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        Sounds = createArray()
    }
    
    func createArray() -> [Sound] {
        var tempSounds : [Sound] = []
        let sound1 =  Sound(image: #imageLiteral(resourceName: "one"), title: "sound1")
        let sound2 = Sound(image: #imageLiteral(resourceName: "two"), title: "sound2")
        let sound3 = Sound(image: #imageLiteral(resourceName: "three"), title: "sound3")
        
        tempSounds.append(sound1)
        tempSounds.append(sound2)
        tempSounds.append(sound3)
        
        return tempSounds
    }
    
    
}

extension SoundListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sounds.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sound = Sounds[indexPath.row]
        //let cell = tableView.dequeueReusableCell(withIdentifier: "SoundCell") as! SoundCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "soundCell") as! SoundCell
        cell.setSoundCell(sound: sound)
        return cell
    }
}
