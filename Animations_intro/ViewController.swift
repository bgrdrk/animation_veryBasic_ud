//
//  ViewController.swift
//  Animations_intro
//
//  Created by Remis on 2020-11-18.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1
    var totalFrames = 13
    var tempo = 0.1
    var isPlaying = false
    var timer = Timer()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var tempoSlider: UISlider!
    
    @IBAction func bouncePressed(_ sender: Any) {
        
        self.imageView.center = CGPoint(x: self.imageView.center.x, y: self.imageView.center.y)
        UIView.animate(withDuration: 1, animations: goUp) {_ in
            self.goDown()
        }
    }
    
    func goUp() {
            self.imageView.center = CGPoint(x: self.imageView.center.x, y: self.imageView.center.y - 250)
    }
    
    func goDown() {
        UIView.animate(withDuration: 1) {
            self.imageView.center = CGPoint(x: self.imageView.center.x, y: self.imageView.center.y + 250)
        }
    }

    
    @IBAction func tempoChanged(_ sender: UISlider) {
        tempo = Double(0.201 - tempoSlider.value)
        if isPlaying {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: tempo, target: self, selector: #selector(playAnimation), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        nextFrame()
    }
    
    @IBAction func playPressed(_ sender: Any) {
        
        if isPlaying {
            timer.invalidate()
            playStopButton.setTitle("Play", for: .normal)
            isPlaying = false
        } else {
            timer = Timer.scheduledTimer(timeInterval: tempo, target: self, selector: #selector(playAnimation), userInfo: nil, repeats: true)
            playStopButton.setTitle("Stop", for: .normal)
            isPlaying = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func nextFrame(){
        imageView.image = UIImage(named: "frame_0\(counter).gif")
        counter = counter == totalFrames ? 0 : counter + 1
    }
    
    @objc func playAnimation(){
        nextFrame()
    }


}

