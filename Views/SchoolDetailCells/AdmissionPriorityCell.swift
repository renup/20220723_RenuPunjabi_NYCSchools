//
//  AdmissionPriorityCell.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/30/22.
//

import Foundation
import UIKit

final class AdmissionPriorityCell: UITableViewCell {
    
    @IBOutlet weak var admissionLabel: UILabel!
    
    func configure(_ detail: String) {
        admissionLabel.text = detail
    }
    
}
