//
//  HomeViewController.swift
//  spajam2018
//
//  Created by shinji asako on 2018/05/27.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // 毎時起動させる機能
    override func viewDidAppear(_ animated: Bool) {
        // カメラロール表示
        super.viewDidAppear(animated)
        
        let c = UIImagePickerController()
        // 動画選択も可能にする
        c.mediaTypes = ["public.image", "public.movie"]
        present(c, animated: true)
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
            cameraPicker.sourceType = sourceTyoe
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }else{
            print("Error")
            
        }
        
        
    }
    
    
    @IBAction func nextBtn(_ sender: Any) {
        goToNextPage()
    }
    
    
    func goToNextPage(){
        self.performSegue(withIdentifier: "toVideo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toVideo" {
            let viewController = segue.destination as! ViewController
        }
    }
}
