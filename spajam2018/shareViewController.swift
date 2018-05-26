//
//  shareViewController.swift
//  spajam2018
//
//  Created by 高橋勇輝 on 2018/05/27.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import UIKit

class shareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tap_share(_ sender: Any) {
        // 共有する文言
        let shareText = "かたことキャスト"
        //共有する動画(仮実装)
        
        let shareVideo = UIImage(named: "main_logo")!
        
        let activityItems = [shareText, shareVideo] as [Any]

        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        present(controller, animated: true, completion: nil)
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
