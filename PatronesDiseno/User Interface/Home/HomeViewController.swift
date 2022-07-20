//
//  HomeViewController.swift
//  PatronesDiseno
//
//  Created by Julio Rodriguez Reategui on 18/07/22.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sampleCharactersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width / 2) - 16, height: 160.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellView.cellIdentifier, for: indexPath) as? CellView
        
        if indexPath.row < sampleCharactersData.count{
            let data = sampleCharactersData[indexPath.row]
            cell?.updateView(data: HomeCellModel(image: data.image, title: data.name))
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailStoryBoard = UIStoryboard(name: "Detail", bundle: nil)
        
        guard let destination = detailStoryBoard.instantiateInitialViewController() as? DetailViewController else { return }
        
        if indexPath.row < sampleCharactersData.count{
            destination.characterData = sampleCharactersData[indexPath.row]
        }
        
        navigationController?.pushViewController(destination, animated: true)
    }
    
}
