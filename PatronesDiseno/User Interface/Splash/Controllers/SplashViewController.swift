//
//  ViewController.swift
//  PatronesDiseno
//
//  Created by Julio Rodriguez Reategui on 18/07/22.
//

import UIKit

protocol SplashViewProtocol: AnyObject{
    func showLoading(_ show: Bool)
    func navigateToHome()
}

class SplashViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: SplashViewModelProtocol?
    
    private let homeStoryboardName: String = "Home"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SplashViewModel(viewDelegate: self)
        viewModel?.onViewsLoaded()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }

}

extension SplashViewController: SplashViewProtocol {
    func showLoading(_ show: Bool){
        switch show {
        case true where !activityIndicator.isAnimating:
            activityIndicator.startAnimating()
            
        case false where activityIndicator.isAnimating:
            activityIndicator.stopAnimating()
            
        default: break
        }
    }
    func navigateToHome() {
        // TODO: NAVEGAR A SIGUIENTE PANTALLA
        let homeStoryBoard = UIStoryboard(name: homeStoryboardName, bundle: nil)
        
        guard let destinationViewController = homeStoryBoard.instantiateInitialViewController() as? HomeViewController else {return}
        
        destinationViewController.viewModel = HomeViewModel(viewDelegate: destinationViewController, characterModelToHomeCellModelMapper: CharacterModelToHomeCellModelMapper())
        
        self.navigationController?.setViewControllers([destinationViewController], animated: true)
    }
}

