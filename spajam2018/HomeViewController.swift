//
//  HomeViewController.swift
//  spajam2018
//
//  Created by shinji asako on 2018/05/27.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var start_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start_button.layer.cornerRadius = 40
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start_video(_ sender: Any) {
        self.goToNextPage()
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
