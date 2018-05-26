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

class PreviewViewController: UIViewController {

    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // loadingを表示
        
        // apiに投げる
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        
        
        let path = url!
        let videoPlayer = AVPlayer(url: path)
        
        // 動画プレイヤーの用意
        let playerController = AVPlayerViewController()
        playerController.player = videoPlayer
        self.present(playerController, animated: true, completion: {
            videoPlayer.play()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
