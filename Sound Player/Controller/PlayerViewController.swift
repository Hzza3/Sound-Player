//
//  PlayerViewController.swift
//  Sound Player
//
//  Created by Ahmed Hazzaa  on 4/10/18.
//  Copyright © 2018 Ahmed Hazzaa . All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    
    var soundImage: UIImage?
    var soundTitle: String = ""
    
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    var prev: CGPoint = CGPoint(x: 0,y: 0)
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBAction func playButton(_ sender: Any)
    {
        player.play()
    }
    @IBAction func pauseButton(_ sender: Any)
    {
        player.pause()
    }
    @IBAction func replayButton(_ sender: Any)
    {
        player.currentTime = 0
    }
    @IBAction func dragGesture(_ sender: UIPanGestureRecognizer)
    {
        let touchPoint = sender.location(in: self.view?.window)
        if sender.state == UIGestureRecognizerState.began {
            initialTouchPoint = touchPoint
        }
        if sender.state == UIGestureRecognizerState.changed
        {
            if touchPoint.y <= 200
            {
                if prev.y < touchPoint.y {
                    //print("decrese alpha")
                    self.view.alpha = self.view.alpha - 0.02
                }
                else if prev.y > touchPoint.y
                {
                    //print("Increase Alpha")
                    self.view.alpha = self.view.alpha + 0.02
                }
            }
            if touchPoint.y > 0
            {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
            prev.y = touchPoint.y
        }
            
        else if sender.state == UIGestureRecognizerState.ended || sender.state == UIGestureRecognizerState.cancelled {
            print("Ended")
            if touchPoint.y > 200 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        playerImage.image = soundImage!
        name.text = soundTitle
        
        do
        {
            let audioPath = Bundle.main.path(forResource: soundTitle, ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            print("Error Ocured")
        }
    }
}
