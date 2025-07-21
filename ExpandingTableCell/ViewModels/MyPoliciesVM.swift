//
//  MyPoliciesVM.swift
//  ArtechTest
//
//  Created by Achintha kahawalage on 2025-07-17.
//

import UIKit

class MyPoliciesVM {
    
    var policies: [Policy] = []
    
    //reading data from Service
    func readData() {
        policies = PolicyService.shared.fetchPolicies()
    }
}
