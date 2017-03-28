//
//  ViewController.swift
//  EnigmaPod
//
//  Created by Nan Wang on 27/3/17.
//  Copyright © 2017 Nan Wang. All rights reserved.
//

import Cocoa
import AVFoundation

var audioTrackCollection:[String] = []
var audioPlayer = AVAudioPlayer()

class ViewController: NSViewController {

    @IBOutlet weak var trackNameLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gettingAudioName()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func gettingAudioName() {
        
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do {
            let audioPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for audio in audioPath {
                
                var localAudio = audio.absoluteString
                
                if localAudio .contains(".mp3") {
                    
                    let audioNameElement = localAudio.components(separatedBy: "/")
                    
                    localAudio = audioNameElement[audioNameElement.count - 1]
                    localAudio = localAudio.replacingOccurrences(of:"%20", with: " ")
                    localAudio = localAudio.replacingOccurrences(of: ".mp3", with: "")
                    
                    audioTrackCollection.append(localAudio)
                    
                    print(audioTrackCollection)
                    
                }
            }
        }
        
        catch {
            print("File Searhing Error!!!")
        }
        
    }
    
    //Screen Interaction
    
    @IBAction func playButtonPressed(_ sender: NSButton) {
        
//        do {
//            let audioPath = Bundle.main.path(forResource: audioTrackCollection[0], ofType: ".mp3")
//            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
//            audioPlayer.play()
//        }
//        
//        catch {
//            print("Play Error")
//        }
        
        audioPlayer.play()
    }
    
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        
        audioPlayer.pause()
    
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        

    }
    
    @IBAction func previousButtonPressed(_ sender: Any) {
   
    }
    
    //Helper Function
    
    func playThis(thisTrack:String) {
        
            do {
                let audioPath = Bundle.main.path(forResource: thisTrack, ofType: ".mp3")
                try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
                audioPlayer.play()
                }
        
            catch {
                print("Play Error")
                }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}




























































