//
//  SearchEntity.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import RealmSwift

struct CarListModel: Decodable {
    let data: [CarListData]?
}

struct CarListData: Decodable {
    let id: Int?
    let carName: String?
    let codeNo: String?
    let seatNo: String?
    let distance: String?
    let rentalFees: String?
    let mileageFees: String?
    let imageUrl: String?
}

class CarListObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var carName: String?
    @objc dynamic var codeNo: String?
    @objc dynamic var seatNo: String?
    @objc dynamic var distance: String?
    @objc dynamic var rentalFee: String?
    @objc dynamic var mileAgeFee: String?
    @objc dynamic var imageUrl: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(CarListObject.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}

class DBManager: NSObject {
    func addCarList(id:Int,
                    carName:String,
                    codeNo:String,
                    seatNo: String,
                    distance: String,rentalFee: String,mileAgeFee: String,imageUrl: String)->Bool{
        
        let carList = CarListObject()
        carList.id = carList.incrementID()
        carList.carName = carName
        carList.codeNo = codeNo
        carList.seatNo = seatNo
        carList.distance = distance
        carList.rentalFee  = rentalFee
        carList.mileAgeFee = mileAgeFee
        carList.imageUrl = imageUrl
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(carList)
        }
        return true
    }
    
    func addCarLists(carList: CarListObject) -> Bool {
        let realm = try! Realm()
        try! realm.write {
            realm.add(carList)
        }
        return true
    }
    
    func getAllCarList() -> Array<CarListObject> {
        var carLists = [CarListObject]()
        
        let realm = try! Realm()
        let personObj = realm.objects(CarListObject.self)
        
        if personObj.count != 0 {
            for person in personObj {
                carLists.append(person)
            }
        }
        return carLists
    }
    
    func deleteAllCarList(){
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(CarListObject.self))
        }
    }
}

