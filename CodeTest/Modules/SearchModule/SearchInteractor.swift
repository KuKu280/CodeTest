//
//  SearchInteractor.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.


import Foundation

class SearchInteractor {
    
    // MARK: Delegate initialization
    var presenter: SearchInterectorToPresenterProtocol?
    
    // MARK: - Call Service
    func loadJson() {
        if let url = Bundle.main.url(forResource: "CarList", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(CarListModel.self, from: data)
                self.presenter?.success(jsonData)
            } catch {
                print("error:\(error)")
            }
        }
    }
}

// MARK: - Presenter to Interactor
extension SearchInteractor: SearchPresentorToInterectorProtocol {
    
}
