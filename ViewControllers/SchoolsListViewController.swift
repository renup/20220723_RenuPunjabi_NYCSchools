//
//  SchoolsListViewController.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import UIKit

class SchoolsListViewController: UIViewController {
    
    struct Constants {
        static let cellIdentifier = "SchoolCell"
    }
    
    var schools: [School] = [] {
        didSet {
            schoolsTableView.reloadData()
        }
    }
    
    var selectedSchool: School?

    @IBOutlet weak var schoolsTableView: UITableView!
    let viewModel = SchoolListViewModel(router: SchoolListRouter())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    private func getData() {
        viewModel.fetchSchoolList {[weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let schools):
                self.schools = schools
            case .failure(let error):
                print("Error during schools list fetch: \(error)")
                let alert = UIAlertController(title: "Error", message: "Opps! something went wrong. \nTry again later.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }

}

extension SchoolsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = schoolsTableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as? SchoolCell else { return UITableViewCell() }
        cell.configure(school: schools[indexPath.row])
        return cell
    }
}

extension SchoolsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSchool = schools[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadSchoolDetails" {
               if let detailViewController = segue.destination as? SchoolDetailViewController {
                   detailViewController.school = selectedSchool
               }
        }
    }
}

