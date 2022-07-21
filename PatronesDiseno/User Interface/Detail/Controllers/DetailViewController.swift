//
//  DetailViewController.swift
//  PatronesDiseno
//
//  Created by Julio Rodriguez Reategui on 20/07/22.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    
    var characterData: HomeCellModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let data = characterData else {
            return
        }

        update(image: data.image)
        update(title: data.title)
    }
    
    private func update(image: String?){
        detailImage.image = UIImage(named: image ?? "")
    }
    
    private func update(title: String?){
        detailTitle.text = title
    }
    
}
