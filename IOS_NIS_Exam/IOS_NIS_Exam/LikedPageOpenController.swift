//
//  LikedPageOpenController.swift
//  IOS_NIS_Exam
//
//  Created by Egor Dadugin on 30.03.2021.
//

import UIKit
import WebKit

class LikedPageOpenController: UIViewController {
    @IBOutlet weak var browserView: WKWebView!
    public var request: URLRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        browserView.load(request)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        browserView.load(request)
    }

}
