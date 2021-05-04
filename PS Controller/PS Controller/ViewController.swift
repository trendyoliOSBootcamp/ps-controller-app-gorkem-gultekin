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
    
    let products: [Product] = [.init(image: UIImage(named: "dualSense")), .init(image: UIImage(named: "dualSense2")),.init(image: UIImage(named: "dualSense"))]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ControllerCell", bundle: .main), forCellWithReuseIdentifier: "PSCell")
    }
    @IBAction func basketButtonClicked() {
        print("basket button clicked")
        performSegue(withIdentifier: "DetailPage", sender: nil)
    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PSCell", for: indexPath) as? ControllerCell
        else{ return .init() }
        
        let product = products[indexPath.row]
        cell.configure(image: product.image)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailPage", sender: nil)
    }
}
extension UIViewController: UICollectionViewDelegateFlowLayout{

    private static let spacing: CGFloat = 50.0
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left:UIViewController.spacing, bottom: 0, right: UIViewController.spacing)
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return UIViewController.spacing

    }
    
    
}
