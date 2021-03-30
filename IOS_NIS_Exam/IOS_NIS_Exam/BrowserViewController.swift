//
//  BrowserViewController.swift
//  IOS_NIS_Exam
//
//  Created by Egor Dadugin on 30.03.2021.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController {

    @IBOutlet weak var browserView: WKWebView!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBAction func likePageAction(_ sender: Any) {
        if(likeButton.currentImage == UIImage(systemName: "star")){
            likedPages.append(urlTextField.text!)
            likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            print(likedPages)
        } else {
            if let index = likedPages.firstIndex(of: urlTextField.text!){
                likedPages.remove(at: index)
                likeButton.setImage(UIImage(systemName: "star"), for: .normal)
                print (likedPages)
            }
        }
        saveData()
    }
    @IBAction func updatePage(_ sender: Any) {
        if let url = URL(string: urlTextField.text!){
            let urlRequest = URLRequest(url: url)
            if(likedPages.contains(urlTextField.text!)){
                likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            } else {
                likeButton.setImage(UIImage(systemName: "star"), for: .normal)
            }
            browserView.load(urlRequest)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        urlTextField.borderStyle = .roundedRect
        searchButton.layer.cornerRadius = 5
    }
    

    override func viewDidAppear(_ animated: Bool) {
        updatePage(self)
    }

}
