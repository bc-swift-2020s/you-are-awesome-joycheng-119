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
     let totalNumberOfImages = 5
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showButtonPressed(_ sender: Any) {
        let messages = ["you are awesome",
                        "you are great",
                        "you are fantastic",
                        "genius bar calls you when they need help",
                        "fabulous? thats you",
                        "you got skills"]
        var newMessageNumber : Int
        repeat {
                newMessageNumber = Int.random(in:0...messages.count-1)
        } while messageNumber == newMessageNumber
        messageNumber = newMessageNumber
        messageLabel.text = messages[newMessageNumber]
    
        
        var newImageNumber : Int
       repeat{
            newImageNumber = Int.random (in:0...totalNumberOfImages)
        }  while imageNumber == newImageNumber
        imageNumber = newImageNumber
        imageView.image = UIImage(named:"image\(imageNumber)")
        
        if let sound = NSDataAsset(name: "sound0"){
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }catch {
                print ("😠error:\(error)!")
            }
        }else{
            print ("😠error!")
        }
}

}
