//
//  CarListTableViewCell.swift
//  CodeTest
//
//  Created by Ku Ku Zan on 9/25/22.
//

import UIKit
import Kingfisher

class CarListTableViewCell: UITableViewCell {

    @IBOutlet weak var kmbgView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var codeNoLabel: UILabel!
    @IBOutlet weak var seatNoLabel: UILabel!
    @IBOutlet weak var mileageFeeLabel: UILabel!
    @IBOutlet weak var rentalFeeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var thumbnaiView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func setupCellUI() {
        kmbgView.layer.borderWidth = 1
        kmbgView.layer.borderColor = UIColor.gray.cgColor
        kmbgView.layer.cornerRadius = 5
    }
    
    func setData(data: CarListObject) {
        titleLable.text = data.carName
        codeNoLabel.text = data.codeNo
        seatNoLabel.text = "\(data.seatNo ?? "") Seats"
        distanceLabel.text = data.distance
        rentalFeeLabel.text = data.rentalFee
        mileageFeeLabel.text = data.mileAgeFee
        thumbnaiView.kf.setImage(with: URL(string: data.imageUrl ?? ""))
    }
    
}
