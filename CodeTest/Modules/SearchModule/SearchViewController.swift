//
//  SearchViewController.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.


import Foundation
import UIKit
import RealmSwift

class SearchViewController: UIViewController {
    
    // MARK: Delegate initialization
    var presenter: SearchViewToPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet weak var carListTableView: UITableView!
    
    // MARK: Custom initializers go here
    var carList = [CarListObject]()
    let dbManager: DBManager = DBManager()
  
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.started()
     
    }
    
    
    // MARK: User Interaction - Actions & Targets
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Additional Helpers
    fileprivate func setupTableView(){
        carListTableView.delegate = self
        carListTableView.dataSource = self
        carListTableView.registerCell(type: CarListTableViewCell.self)
    }
}

// MARK: - Extension
/**
 - UITableView DataSource & Delegate
 */
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarListTableViewCell.identifier, for: indexPath)as? CarListTableViewCell else { return  UITableViewCell()
        }
        cell.setData(data: carList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushView(DetailRouter(data: carList[indexPath.row]))
    }
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
}

// MARK: - Presenter to View
extension SearchViewController: SearchPresenterToViewProtocl {
    
    func initialControlSetup() {
        navigationController?.isNavigationBarHidden = true
        setupTableView()
        presenter?.fetchJsonData()
    
    }
    
    func parseJsonData(data: CarListModel) {
        self.dbManager.deleteAllCarList()
        let listData = data.data
        listData?.map({ list in
            self.dbManager.addCarList(id: list.id ?? 0, carName: list.carName ?? "", codeNo: list.codeNo ?? "", seatNo: list.seatNo ?? "", distance: list.distance ?? "",rentalFee: list.rentalFees ?? "",mileAgeFee: list.mileageFees ?? "", imageUrl: list.imageUrl ?? "")
        })
        self.carList = self.dbManager.getAllCarList()
        carListTableView.reloadData()
    }

}
