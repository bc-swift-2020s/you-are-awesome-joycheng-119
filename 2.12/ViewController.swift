//
//  ViewController.swift
//  2.12
//
//  Created by cheng jiayi on 2020/1/26.
//  Copyright © 2020 cheng jiayi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    var imageNumber = 0
    var messageNumber = 0
    var soundNumber = 0
    let totalNumberOfImages = 5
    let totalNumberOfSounds = 5
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(name:String) {
        if let sound = NSDataAsset(name: name){
        do {
            try audioPlayer = AVAudioPlayer(data: sound.data)
            audioPlayer.play()
        } catch {
            print ("😠error:\(error)!")
        }
    }
    
        func nonRepeatingNumber(originalNumber: Int, upperLimit: Int) -> Int{
        var newNumber: Int
        repeat{
                 newNumber = Int.random (in:0...upperLimit)
             }  while originalNumber == newNumber
             return newNumber
        }
        func showButtonPressed(_ sender: Any) {
        let messages = ["you are awesome",
                        "you are great",
                        "you are fantastic",
                        "genius bar calls you when they need help",
                        "fabulous? thats you",
                        "you got skills"]
        
            messageNumber = nonRepeatingNumber(originalNumber: messageNumber, upperLimit: messages.count-1)
        messageLabel.text = messages[messageNumber]
        
        
        imageNumber = nonRepeatingNumber(originalNumber: imageNumber, upperLimit: totalNumberOfImages-1)
        imageView.image = UIImage(named:"image\(imageNumber)")
        
            soundNumber = nonRepeatingNumber(originalNumber: soundNumber, upperLimit: totalNumberOfSounds-1)
            playSound(name: "sound\(soundNumber)")
            
        }
    }
}

