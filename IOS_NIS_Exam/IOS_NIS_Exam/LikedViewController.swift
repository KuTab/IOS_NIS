//
//  LikedViewController.swift
//  IOS_NIS_Exam
//
//  Created by Egor Dadugin on 30.03.2021.
//

import UIKit

class LikedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, URLCellDelegate{
    
    func didLikeButtonPressed(cell: URLCell) {
        if let index = likedPages.firstIndex(of: cell.urlLabel.text!){
            likedPages.remove(at: index)
            collectionView.reloadData()
            print (likedPages)
        }
        saveData()
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likedPages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! URLCell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.urlLabel.text = likedPages[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: likedPages[indexPath.row]){
            let urlRequest = URLRequest(url: url)
            if let controller = storyboard?.instantiateViewController(withIdentifier: "LikedPageOpen") as?  LikedPageOpenController{
                controller.request = urlRequest
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

}
