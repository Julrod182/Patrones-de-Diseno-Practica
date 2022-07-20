//
//  ViewController.swift
//  PatronesDiseno
//
//  Created by Julio Rodriguez Reategui on 18/07/22.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !activityIndicator.isAnimating{
            activityIndicator.startAnimating()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }
    
    private func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            // TODO: NAVEGAR A SIGUIENTE PANTALLA
            let homeStoryBoard = UIStoryboard(name: "Home", bundle: nil)
            
            guard let destinationViewController = homeStoryBoard.instantiateInitialViewController() else {return}
            
            self.navigationController?.setViewControllers([destinationViewController], animated: true)
            
        }
    }


}

