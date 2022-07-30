//
//  SchoolDetailViewController.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation
import UIKit

final class SchoolDetailViewController: UIViewController {
    
    @IBOutlet var detailView: SchoolDetailView!
    
    var school: School?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.school = school
    }
    
}
