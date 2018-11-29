//
//  ViewController.swift
//  SlideshowApp
//
//  Created by デザイン情報学科 on 2018/11/23.
//  Copyright © 2018年 shono.iso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slide: UIImageView!
    @IBOutlet weak var playButtonUI: UIButton!
    @IBOutlet weak var nextButtonUI: UIButton!
    @IBOutlet weak var backButtonUI: UIButton!
    
    var slideTimer: Timer!
    var nowNum = 0
    
    func displayImage() {
        let imageNameArray = [
            "IMG_5878.JPG",
            "IMG_5879.JPG",
            "IMG_5880.JPG",
            ]
        if nowNum < 0 {
            nowNum = 2
        }
        if nowNum > 2 {
            nowNum = 0
        }
        let name = imageNameArray[nowNum]
        let image = UIImage(named: name)!
        
        slide.image = image
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Screen Size の取得
        displayImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateSlide(_ timer: Timer) {
        nowNum+=1
        displayImage()
    }

    
    @IBAction func nextButton(_ sender: Any) {
        nowNum+=1
        displayImage()
    }
    @IBAction func backButton(_ sender: Any) {
        nowNum-=1
        displayImage()
    }
    
    @IBAction func playButton(_ sender: Any) {
        if self.slideTimer == nil {
            self.slideTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateSlide(_:)), userInfo: nil, repeats: true)
            playButtonUI.setTitle("停止",for:UIControlState.normal)
            nextButtonUI.isEnabled = false
            backButtonUI.isEnabled = false
        }
        else {
            self.slideTimer.invalidate()
            self.slideTimer = nil
            playButtonUI.setTitle("再生",for:UIControlState.normal)
            nextButtonUI.isEnabled = true
            backButtonUI.isEnabled = true
        }
    }
    
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "zoom", sender: nowNum)
        
        if self.slideTimer != nil{
            self.slideTimer.invalidate()
            playButtonUI.setTitle("再生",for:UIControlState.normal)
            nextButtonUI.isEnabled = true
            backButtonUI.isEnabled = true
            self.slideTimer = nil
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomimageview:zoomImageView = segue.destination as! zoomImageView
        zoomimageview.nowNum = sender as! Int
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

