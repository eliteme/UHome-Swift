//
//  CommentViewController.swift
//  UHome
//
//  Created by 张星宇 on 16/2/23.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()
        self.title = "评论"
        
        let noCommentHintLabel = UILabel()
        view.addSubview(noCommentHintLabel)
        noCommentHintLabel.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(view.snp_center)
        }
        
        noCommentHintLabel.text = "您还没有收到任何评价  ~~~~(>_<)~~~~"
        noCommentHintLabel.font = UIFont.systemFontOfSize(20)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
