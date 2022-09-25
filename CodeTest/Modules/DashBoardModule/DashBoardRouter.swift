//
//  DashBoardRouter.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit
import Foundation

class DashBoardRouter: BaseRouter {
    
    // MARK: - Private properties
    private let storyboard = UIStoryboard(name: "DashBoard", bundle: nil)
    
    // MARK: Module Setup
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: DashBoardViewController.self)
        super.init(viewController: moduleViewController)
        let interactor = DashBoardInteractor()
        let presenter = DashBoardPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
        interactor.presenter = presenter
    }
    
}

// MARK: - Presenter to Wireframe Interface
extension DashBoardRouter: DashBoardPresenterToRouterProtocol {
    
    func navigateToSearchResultScreen() {
        self.navigationController?.pushView(SearchRouter())
    }
    
}
