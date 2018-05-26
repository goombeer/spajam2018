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
        
        // apiに投げる
        let fileContent = url!
        let apiUrl = "https://e8773789.ngrok.io/data/upload"
        let headers: HTTPHeaders = [:]
        
        let test = try? Data(contentsOf: url!)
        
        
        Alamofire.upload(
            multipartFormData: { (multipartFormData) in
                multipartFormData.append(test!,
                                         withName: "uploadFile",
                                         fileName: "filename.mov",
                                         mimeType: "multipart/form-data")},
            to: apiUrl,
            headers: headers,
            encodingCompletion: { encodingResult in
                // file をエンコードした後のコールバック
                switch encodingResult {
                case .success(let upload, _, _):
                    // upload は request の戻り値の DataRequest を継承したオブジェクトなので
                    // request と同様にメソッドチェーンしたい項目はこの中で指定できます
                    upload
                        .authenticate(user: "user", password: "password")
                        .uploadProgress(closure: { (progress) in
                            print("Upload Progress: \(progress.fractionCompleted)")
                        })
                        .responseString { response in
                            debugPrint(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
        }
        )
        
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
