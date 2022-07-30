//
//  SchoolDetailViewController.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation
import UIKit

final class SchoolDetailViewController: UIViewController {
        
    var school: School?
    var viewModel: SchoolDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentSchool = school {
            viewModel = SchoolDetailViewModel(school: currentSchool)
        }
    }
}

extension SchoolDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(Section(rawValue: section) ?? .website) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section), let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") else { return UITableViewCell() }
        cell.textLabel?.text = viewModel?.textForCell(in: section, at: indexPath.row)
        return cell
        
    }
}

extension SchoolDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
