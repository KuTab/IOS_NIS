//
//  ViewController.swift
//  BlurApp
//
//  Created by Egor Dadugin on 01.02.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var backgroundImageView:UIImageView!
    let imageSet = ["cloud", "coffee", "food", "space", "temple"]
    var blurEffectView: UIVisualEffectView?
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        blurEffectView?.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let selectedImageIndex = Int(arc4random_uniform(5))
        backgroundImageView.image = UIImage(named: imageSet[selectedImageIndex])
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView!)
    }


}

