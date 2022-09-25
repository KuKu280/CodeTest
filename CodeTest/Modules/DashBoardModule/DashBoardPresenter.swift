//
//  DashBoardPresenter.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

class DashBoardPresenter {
    
    // MARK: - Private properties
    private unowned var view: DashBoardPresenterToViewProtocl
    private var interactor: DashBoardPresentorToInterectorProtocol
    private var router: DashBoardPresenterToRouterProtocol
    
    // MARK: - Lifecycle
    init(view: DashBoardPresenterToViewProtocl, interactor: DashBoardPresentorToInterectorProtocol, router: DashBoardPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

// MARK: - View to Presenter
extension DashBoardPresenter: DashBoardViewToPresenterProtocol {
    
    func started() {
        view.initialControlSetup()
    }
    
    func clickedGoButton() {
        router.navigateToSearchResultScreen()
    }
}

// MARK: - Interactor to Presenter
extension DashBoardPresenter: DashBoardInterectorToPresenterProtocol {
    
}

