//
//  ViewController.swift
//  PS Controller
//
//  Created by Görkem Gültekin on 3.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var basketButton: UIButton!
    
    let products: [Product] = [.init(image: UIImage(named: "dualSense")), .init(image: UIImage(named: "dualSense2"))]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ControllerCell", bundle: .main), forCellWithReuseIdentifier: "PSCell")
    }
    @IBAction func basketButtonClicked() {
        print("basket button clicked")
    }
    

}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PSCell", for: indexPath) as? ControllerCell else{return .init()}
        let product = products[indexPath.row]
        cell.configure(image: product.image)
        return cell
    }
    
    
}
extension UIViewController: UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 28 - 24) / 1.3982
        return .init(width: cellWidth, height: cellWidth / 0.7938)
    }
}
