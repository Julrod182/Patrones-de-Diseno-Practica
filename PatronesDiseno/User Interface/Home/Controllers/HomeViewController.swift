//
//  HomeViewController.swift
//  PatronesDiseno
//
//  Created by Julio Rodriguez Reategui on 18/07/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func updateViews()
    func navigateToDetail(with data: HomeCellModel?)
}

class HomeViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: HomeViewModelProtocol?
    
    private let detailStoryboardName = "Detail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        viewModel?.onViewsLoaded()
    }
    
    private func configureViews(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func updateViews(){
        collectionView.reloadData()
    }
    
    func navigateToDetail(with data: HomeCellModel?) {
        let detailStoryBoard = UIStoryboard(name: detailStoryboardName, bundle: nil)
        
        guard let viewData = data,
              let destination = detailStoryBoard.instantiateInitialViewController() as? DetailViewController else { return }
        
        destination.viewModel = DetailViewModel(viewDelegate: destination, data: viewData)
        
        navigationController?.pushViewController(destination, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.dataCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width / 2) - 16, height: 160.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellView.cellIdentifier, for: indexPath) as? CellView
        
        if let data = viewModel?.data(for: indexPath.row){
            cell?.updateView(data: data)
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        viewModel?.onItemSelected(at: indexPath.row)
        
    }
    
}
