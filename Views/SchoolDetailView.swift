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
    var viewModel: SchoolDetailViewModel?
    
    @IBOutlet weak var detailsTable: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if let currentSchool = school {
            viewModel = SchoolDetailViewModel(school: currentSchool)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        if let currentSchool = school {
            viewModel = SchoolDetailViewModel(school: currentSchool)
        }
    }
    
    
    
    

}

extension SchoolDetailView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(Section(rawValue: section) ?? .website) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
            
            
        case .admissionPriority:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier) as? AdmissionPriorityCell else { return UITableViewCell() }
            return cell
            
        case .address:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier) as? AddressCell else { return UITableViewCell() }
            return cell
        case .contactInformation:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier) as? SchoolContactCell else { return UITableViewCell() }
            return cell
        case .website:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier) as? SchoolWebsiteCell else { return UITableViewCell() }
            return cell
        }
    }
    
}

extension SchoolDetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

