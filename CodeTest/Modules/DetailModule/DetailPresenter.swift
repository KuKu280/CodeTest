//
//  DetailPresenter.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.


import Foundation
import UIKit

class DetailPresenter {
    
    // MARK: - Private properties
    private unowned var view: DetailPresenterToViewProtocl
    private var interactor: DetailPresentorToInterectorProtocol
    private var router: DetailPresenterToRouterProtocol
    
    // MARK: - Lifecycle
    init(view: DetailPresenterToViewProtocl, interactor: DetailPresentorToInterectorProtocol, router: DetailPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

// MARK: - View to Presenter
extension DetailPresenter: DetailViewToPresenterProtocol {
    
    func started() {
        view.initialControlSetup()
    }
    
}

// MARK: - Interactor to Presenter
extension DetailPresenter: DetailInterectorToPresenterProtocol {
    
}

