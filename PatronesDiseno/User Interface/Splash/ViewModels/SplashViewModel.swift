//
//  SplashViewModel.swift
//  PatronesDiseno
//
//  Created by Julio Rodriguez Reategui on 20/07/22.
//

import Foundation

protocol SplashViewModelProtocol: AnyObject{
    func onViewsLoaded()
}

final class SplashViewModel {
    
    weak var viewDelegate: SplashViewProtocol?
    
    init(viewDelegate: SplashViewProtocol?){
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            // TODO: NOTIFICAR A LA VISTA NAVEGAR SIGUIENTE PANTALLA
            self?.viewDelegate?.showLoading(false)
            self?.viewDelegate?.navigateToHome()
            
        }
    }
}

extension SplashViewModel: SplashViewModelProtocol{
    
    func onViewsLoaded(){
        loadData()
    }
    
}
