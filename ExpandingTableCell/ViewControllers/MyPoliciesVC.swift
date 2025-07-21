//
//  ViewController.swift
//  ArtechTest
//
//  Created by Achintha kahawalage on 2025-07-16.
//

import UIKit

class MyPoliciesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MyPoliciesVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        self.viewModel.readData()
        tableView.register(UINib(nibName: "MyPolicyTVC", bundle: nil), forCellReuseIdentifier: "MyPolicyTVC")
        tableView.reloadData()
    }
    
}


//Policies TableView
extension MyPoliciesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.policies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPolicyTVC", for: indexPath) as! MyPolicyTVC
        
        cell.setupCell( policy: viewModel.policies[indexPath.row])
        
        cell.onToggleExpansion = { [weak self]  id in
            guard let self = self else { return }
            if let index = self.viewModel.policies.firstIndex(where: { $0.id == self.viewModel.policies[indexPath.row].id }) {
                self.viewModel.policies[index].isExpanded.toggle()
                self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
            }
        }
        
        return cell
        
    }
}
