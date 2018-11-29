//
//  zoomImageView.swift
//  SlideshowApp
//
//  Created by デザイン情報学科 on 2018/11/23.
//  Copyright © 2018年 shono.iso. All rights reserved.
//

import UIKit

class zoomImageView: UIViewController {
    
    @IBOutlet weak var Image: UIImageView!
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
        // 画像を読み込み
        let image = UIImage(named: name)!
        // Image Viewに読み込んだ画像をセット
        Image.image = image
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
