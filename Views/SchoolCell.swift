//
//  SchoolCell.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation
import UIKit

final class SchoolCell: UITableViewCell {
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var neighborhood: UILabel!
    
    func configure(school: School) {
        schoolLabel.text = school.schoolName
        neighborhood.text = school.neighborhood
    }
}
