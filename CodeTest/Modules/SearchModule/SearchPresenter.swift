//
//  SearchPresenter.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.


import Foundation
import UIKit

class SearchPresenter {
    
    // MARK: - Private properties
    private unowned var view: SearchPresenterToViewProtocl
    private var interactor: SearchPresentorToInterectorProtocol
    private var router: SearchPresenterToRouterProtocol
    
    // MARK: - Lifecycle
    init(view: SearchPresenterToViewProtocl, interactor: SearchPresentorToInterectorProtocol, router: SearchPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

// MARK: - View to Presenter
extension SearchPresenter: SearchViewToPresenterProtocol {
    
    func started() {
        view.initialControlSetup()
    }
    
    func fetchJsonData() {
        interactor.loadJson()
    }
}

// MARK: - Interactor to Presenter
extension SearchPresenter: SearchInterectorToPresenterProtocol {
    
    func success(_ response: CarListModel) {
        view.parseJsonData(data: response)
    }
    
}

