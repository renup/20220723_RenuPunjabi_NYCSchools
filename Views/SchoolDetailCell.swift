//
//  SchoolDetailCell.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/30/22.
//

import Foundation
import UIKit

final class SchoolDetailCell: UITableViewCell {
    
    @IBOutlet weak var detailLabel: UILabel!
    
    func configure(_ detail: String) {
        detailLabel.text = detail
    }
    
}
