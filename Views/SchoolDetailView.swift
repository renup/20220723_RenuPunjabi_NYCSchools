//
//  SchoolDetailView.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation
import UIKit

final class SchoolDetailView: UIView {
    
    var school: School?
    
    @IBOutlet weak var admissionsPriorityLabel1: UILabel!
    
    @IBOutlet weak var admissionsPriorityLabel2: UILabel!
    
    @IBOutlet weak var admissionsPriorityLabel3: UILabel!


    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var buildingCode: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var zipLabel: UILabel!

    @IBOutlet weak var stateCodeLabel: UILabel!
    
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var faxLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!


    @IBOutlet weak var websiteLabel: UILabel!
    

}
