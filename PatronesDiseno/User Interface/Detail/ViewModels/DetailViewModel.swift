//
//  DetailViewModel.swift
//  PatronesDiseno
//
//  Created by Julio Rodriguez Reategui on 21/07/22.
//

import Foundation

protocol DetailViewModelProtocol {
    func onViewsLoaded()
}

final class DetailViewModel {
    
    private weak var viewDelegate: DetailViewProtocol?
    private var viewData: HomeCellModel
    
    init(viewDelegate: DetailViewProtocol, data: HomeCellModel) {
        viewData = data
        self.viewDelegate = viewDelegate
    }
    
}

extension DetailViewModel: DetailViewModelProtocol{
    func onViewsLoaded() {
        viewDelegate?.update(image: viewData.image)
        viewDelegate?.update(title: viewData.title)
        viewDelegate?.update(description: viewData.description)
        viewDelegate?.update(score: viewData.score)
    }
}
