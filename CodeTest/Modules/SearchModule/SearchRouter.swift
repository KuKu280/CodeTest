//
//  SearchRouter.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit
import Foundation

class SearchRouter: BaseRouter {
    
    // MARK: - Private properties
    private let storyboard = UIStoryboard(name: "Search", bundle: nil)
    
    // MARK: Module Setup
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: SearchViewController.self)
        super.init(viewController: moduleViewController)
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
        interactor.presenter = presenter
    }
    
}

// MARK: - Presenter to Wireframe Interface
extension SearchRouter: SearchPresenterToRouterProtocol {
    
    func navigate(to option: SearchNavigationOption) {
        // ...
    }
    
}
