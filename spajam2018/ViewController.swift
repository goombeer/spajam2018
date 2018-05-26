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
    var pathUrl:URL?
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
//            captureButton.setTitle("動画を取る", for: .normal)
        }
    }
    
    func goToNextPage(){
        self.performSegue(withIdentifier: "toPreview", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPreview" {
            let previewController = segue.destination as! PreviewViewController
            previewController.url = pathUrl!
        }
    }
    
    // 動画撮影開始
    // startVideoRecording()で、ビデオ撮影を開始した時に、このメソッドが呼ばれます
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didBeginRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
        
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishProcessVideoAt url: URL) {
        // ビデオ撮影を終了し、ビデオの処理が終わった時に、このメソッドが呼ばれます
        // 撮影データは、（url: URL）で受け取ることができます
        // apiに送る
        
        pathUrl = url
        
        goToNextPage()
        
    }


}

