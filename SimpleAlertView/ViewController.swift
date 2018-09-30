//
//  ViewController.swift
//  SimpleAlertView
//
//  Created by 高永效 on 15/10/29.
//  Copyright © 2015年 EgeTart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //第二种方式
        //接收通知
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "receiveNotification:", name: "buttonClick", object: nil)
    }
    
    @IBAction func showAlertView(_ sender: UIButton) {
        //加载xib文件, 拿到自定义的SimpleAlertView, 设置大小和位置并添加到根视图中
        let alertView = Bundle.main.loadNibNamed("SimpleAlertView", owner: nil, options: nil)?.first as! SimpleAlertView
        alertView.tag = 101
        
        alertView.delegate = self
        //        第一种方式
        //        alertView.setActionHandler("cancle") { () -> Void in
        //            print("test")
        //            alertView.removeFromSuperview()
        //        }
        
        self.view.addSubview(alertView)
    }
    
    func receiveNotification(notification: NSNotification) {
        
        let alertView = self.view.viewWithTag(101) as! SimpleAlertView
        
        let action = notification.userInfo!["actionType"] as! String
        
        if action == "cancle" {
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                alertView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.maxY)
                alertView.layer.opacity = 0
                }) { (_) -> Void in
                    alertView.removeFromSuperview()
            }
            
        }else {
            alertView.removeFromSuperview()
        }
        
    }

}

//第三种方式
extension ViewController: SimpleAlertViewDelegate {
    func simpleAlertView(actionType action: String) {
        
        let alertView = self.view.viewWithTag(101) as! SimpleAlertView
        
        if action == "cancle" {
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                alertView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.maxY)
                alertView.layer.opacity = 0
                }) { (_) -> Void in
                    alertView.removeFromSuperview()
            }
            
        }else {
            alertView.removeFromSuperview()
        }
    }
}

