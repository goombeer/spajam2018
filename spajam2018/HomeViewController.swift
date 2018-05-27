//
//  HomeViewController.swift
//  spajam2018
//
//  Created by shinji asako on 2018/05/27.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var pathUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // カメラロール
    @IBAction func albumButton(_ sender: Any) {
        
        let sourceTyoe:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            
            // 動画選択も可能にする
            cameraPicker.mediaTypes = ["public.image", "public.movie"]
            present(cameraPicker, animated: true)
            
            
            cameraPicker.sourceType = sourceTyoe
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
            
            
        }else{
            print("Error")
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentationDirectory, .userDomainMask, true)[0] as String
        let fileName = "tmpVideo.mp4"
        let videoPath = documentsPath + fileName
        print(videoPath)
        pathUrl = URL(fileURLWithPath: videoPath)
        goToPreviewPage()
        picker.dismiss(animated: true, completion: nil)
    }
    
    // previewページ
    func goToPreviewPage(){
        print(true)
        self.performSegue(withIdentifier: "nextPreview", sender: nil)
        print("とおっている")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "nextPreview" {
            let previewController = segue.destination as! PreviewViewController
            previewController.url = pathUrl!
        }
    }
    
    

    
    @IBAction func nextBtn(_ sender: Any) {
        goToNextPage()
    }
    
    // カメラ起動ページ
    func goToNextPage(){
        self.performSegue(withIdentifier: "toVideo", sender: nil)
    }
    
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
    }
}
