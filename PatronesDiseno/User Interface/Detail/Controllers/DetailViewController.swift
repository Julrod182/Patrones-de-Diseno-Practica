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
    func update(description: String?)
    func update(score: Float?)
}

class DetailViewController: UIViewController{
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDescription: UITextView!
    @IBOutlet weak var detailScore: UILabel!
    
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
    
    func update(description: String?){
        detailDescription.text = description
    }
    
    func update(score: Float?){
        detailScore.text = "Score: \(score ?? 0)"
    }
}
