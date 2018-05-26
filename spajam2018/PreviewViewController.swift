//
//  PreviewViewController.swift
//  spajam2018
//
//  Created by shinji asako on 2018/05/26.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Alamofire // Alamofireをimport
import SwiftGifOrigin

class PreviewViewController: UIViewController {

    var url: URL?
    
    @IBOutlet var loadingImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        // loadingを表示
          let loadingGif = UIImage.gif(name: "loading")
          loadingImg.image = loadingGif
          loadingImg.loadGif(name: "loading")
//        // UIImageView 初期化
//        let imageView = UIImageView(image:loadingGif!)
//        // 画面の横幅を取得
//        let screenWidth:CGFloat = view.frame.size.width
//        let screenHeight:CGFloat = view.frame.size.height
//
//        // 画像の中心を画面の中心に設定
//        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
//
//        // UIImageViewのインスタンスをビューに追加
//        self.view.addSubview(imageView)
        
        // apiに投げる
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        
        
//        let path = url!
//        let videoPlayer = AVPlayer(url: path)
//
//        // 動画プレイヤーの用意
//        let playerController = AVPlayerViewController()
//        playerController.player = videoPlayer
//        self.present(playerController, animated: true, completion: {
//            videoPlayer.play()
//        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
