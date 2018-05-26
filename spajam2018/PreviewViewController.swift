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
import SwiftyJSON

struct FetchResult: Codable {
    let result: String
    let url: String
}

class PreviewViewController: UIViewController {

    var url: URL?
    
    @IBOutlet var loadingImg: UIImageView!
    @IBOutlet var back: UIImageView!
    var path: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loadingGif = UIImage.gif(name: "loading")
        loadingImg.image = loadingGif
        
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
                        .responseString { response in
                            
                            if let res = response.result.value {
                                let jsondata = res.data(using: .utf8)
                                let fetchresult = try! JSONDecoder().decode(FetchResult.self, from: jsondata!)
                                print(fetchresult.url)
                                self.path = URL(string: fetchresult.url)!
                                self.appearPreview(url: URL(string: fetchresult.url)!)
                            }
                            
                            
                            
                            
                            
                            
                    }
                    
                    // self.appearPreview()
                    
                case .failure(let encodingError):
                    print(encodingError)
                }
        }
        )
        
    }
    
    func appearPreview(url: URL) {

        back.image = UIImage()
        let path = url
        let videoPlayer = AVPlayer(url: path)
        NotificationCenter.default.addObserver(self, selector: Selector(("playerDidFinishPlaying:")),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: videoPlayer.currentItem)
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
    
    func playerDidFinishPlaying(note: NSNotification) {
        self.performSegue(withIdentifier: "toShare", sender: path)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShare" {
            let shareViewController = segue.destination as! shareViewController
            shareViewController.moviePath = path
        }
    }
}
