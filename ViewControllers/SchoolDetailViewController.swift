//
//  SchoolDetailViewController.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation
import UIKit

final class SchoolDetailViewController: UIViewController {
        
    @IBOutlet weak var detailsTableView: UITableView!
    
    var school: School?
    var viewModel: SchoolDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentSchool = school {
            viewModel = SchoolDetailViewModel(school: currentSchool)
        }
        navigationItem.title = school?.schoolName
        self.detailsTableView.setContentOffset(CGPoint(x: 0, y: 44), animated: false)

    }
}

extension SchoolDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.dataSource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(viewModel?.dataSource[section] ?? .website) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = viewModel?.dataSource[indexPath.section], let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as? SchoolDetailCell else { return UITableViewCell() }
        cell.configure(viewModel?.textForCell(in: section, at: indexPath.row) ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sect = viewModel?.dataSource[section] else { return nil }
        return sect.header
    }
}

extension SchoolDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
