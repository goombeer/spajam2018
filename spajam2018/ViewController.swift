//
//  ViewController.swift
//  spajam2018
//
//  Created by 高橋勇輝 on 2018/05/26.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import UIKit
import SwiftyCam

class ViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate {
    
    var movieFlag = false
    
    // caputureボタン
    @IBOutlet var captureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SwiftyCamのdelegate
        cameraDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startCaptureMovie(_ sender: Any) {
        if(movieFlag == false) {
            startVideoRecording()
            movieFlag = true
            captureButton.setTitle("撮ってる", for: .normal)
        }else {
            stopVideoRecording()
            movieFlag = false
            captureButton.setTitle("動画を取る", for: .normal)
        }
    }
    
    // 動画撮影開始
    // startVideoRecording()で、ビデオ撮影を開始した時に、このメソッドが呼ばれます
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didBeginRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
        
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishProcessVideoAt url: URL) {
        // ビデオ撮影を終了し、ビデオの処理が終わった時に、このメソッドが呼ばれます
        // 撮影データは、（url: URL）で受け取ることができます
        print(url)
    }
    
    // 動画撮影終わり
    // stopVideoRecording()で、ビデオ撮影を終了した時に、このメソッドが呼ばれます
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
        // apiに送る
        print("ビデオが撮影されました")
        
    }


}

