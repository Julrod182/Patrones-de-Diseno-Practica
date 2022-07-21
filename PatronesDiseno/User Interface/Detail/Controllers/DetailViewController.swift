//
//  DetailViewController.swift
//  PatronesDiseno
//
//  Created by Julio Rodriguez Reategui on 20/07/22.
//

import UIKit

protocol DetailViewProtocol : AnyObject {
    func update(image: String?)
    func update(title: String?)
}

class DetailViewController: UIViewController{
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    
    var viewModel: DetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.onViewsLoaded()
        
    }
}

extension DetailViewController: DetailViewProtocol {
    func update(image: String?){
        detailImage.image = UIImage(named: image ?? "")
    }
    
    func update(title: String?){
        detailTitle.text = title
    }
}
