//
//  HomeViewModel.swift
//  PatronesDiseno
//
//  Created by Julio Rodriguez Reategui on 21/07/22.
//

import Foundation

protocol HomeViewModelProtocol{
    var dataCount: Int { get }
    func onViewsLoaded()
    func data(for index: Int) -> HomeCellModel?
    func onItemSelected(at index: Int)
}

final class HomeViewModel {
    private weak var viewDelegate: HomeViewProtocol?
    private let characterModelToHomeCellModelMapper: CharacterModelToHomeCellModelMapperProtocol
    private var viewData = [HomeCellModel]()
    
    init(viewDelegate: HomeViewProtocol?,
         characterModelToHomeCellModelMapper: CharacterModelToHomeCellModelMapperProtocol) {
        self.viewDelegate = viewDelegate
        self.characterModelToHomeCellModelMapper = characterModelToHomeCellModelMapper
    }
    
    private func loadData(){
        viewData = characterModelToHomeCellModelMapper.map(sampleCharactersData)
        viewDelegate?.updateViews()
    }
}

extension HomeViewModel: HomeViewModelProtocol{
    
    var dataCount: Int{
        viewData.count
    }
    
    func onViewsLoaded(){
        loadData()
    }
    
    func data(for index: Int) -> HomeCellModel? {
        guard index < dataCount else { return nil }
        return viewData[index]
    }
    
    func onItemSelected(at index: Int) {
        guard let data = data(for: index) else { return }
        viewDelegate?.navigateToDetail(with: data)
    }
}
