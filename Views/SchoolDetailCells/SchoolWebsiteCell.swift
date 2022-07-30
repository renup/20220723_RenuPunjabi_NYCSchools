//
//  SchoolWebsiteCell.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/30/22.
//

import Foundation
import UIKit

final class SchoolWebsiteCell: UITableViewCell {
   
    func configure(_ detail: String) {
        self.contentView.textLabel.text = detail
    }
}
