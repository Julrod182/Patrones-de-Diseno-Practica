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
    
    var characterData: CharacterModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let characterData = characterData else {
            return
        }

        update(image: characterData.image)
        update(title: "\(characterData.name) \(characterData.lastname)")
    }
    
    private func update(image: String?){
        detailImage.image = UIImage(named: image ?? "")
    }
    
    private func update(title: String?){
        detailTitle.text = title
    }
    
}
