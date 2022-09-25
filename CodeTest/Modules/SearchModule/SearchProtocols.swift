//
//  SearchProtocols.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.


import Foundation
import UIKit

// MARK: - Navigation Option
enum SearchNavigationOption {
    /**
     - example usage
     */
}

// MARK: - Presenter -> View
protocol SearchPresenterToViewProtocl: BaseViewProtocol {
    func initialControlSetup()
    func parseJsonData(data: CarListModel)
}

// MARK: - View -> Presenter
protocol SearchViewToPresenterProtocol: AnyObject {
    func started()
    func fetchJsonData()
}

// MARK: - Interactor -> Presenter
protocol SearchInterectorToPresenterProtocol: AnyObject {
    func success(_ response: CarListModel)
}

// MARK: - Presenter -> Interactor
protocol SearchPresentorToInterectorProtocol: AnyObject {
    func loadJson()
}

// MARK: - Presenter -> Router or WireFrame
protocol SearchPresenterToRouterProtocol: BaseRouterProtocol {
    func navigate(to option: SearchNavigationOption)
}


