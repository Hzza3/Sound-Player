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
    var fileIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        Sounds = createArray()
    }
    
    func createArray() -> [Sound] {
        var tempSounds : [Sound] = []
        let sound1 = Sound(image: #imageLiteral(resourceName: "one"), title: "Al-Ikhlas", soundFileName: "112 - Al-Ikhlas")
        let sound2 = Sound(image: #imageLiteral(resourceName: "two"), title: "Al-Falaq", soundFileName: "113 - Al-Falaq")
        let sound3 = Sound(image: #imageLiteral(resourceName: "three"), title: "An-Nas", soundFileName: "114 - An-Nas")
        
        tempSounds.append(sound1)
        tempSounds.append(sound2)
        tempSounds.append(sound3)
        
        return tempSounds
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPlayer"
        {
          let destinationVC = segue.destination as! PlayerViewController
            destinationVC.fileName = Sounds[fileIndex].soundFileName
            destinationVC.soundImage = Sounds[fileIndex].image
        }
    }
    

    
    
}

extension SoundListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sounds.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sound = Sounds[indexPath.row]
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "soundCell") as! SoundCell
        cell.setSoundCell(sound: sound)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        fileIndex = indexPath.row
        performSegue(withIdentifier: "goToPlayer", sender: self)
    }
}
