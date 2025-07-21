//
//  MyPolicyTVC.swift
//  ArtechTest
//
//  Created by Achintha kahawalage on 2025-07-16.
//

import UIKit

class MyPolicyTVC: UITableViewCell {
    
    @IBOutlet weak var policyNameLbl: UILabel!
    @IBOutlet weak var activeStatusLbl: UILabel!
    @IBOutlet weak var policyNumberLbl: UILabel!
    @IBOutlet weak var readMoreBtn: UIButton!
    @IBOutlet weak var premiumDueLbl: UILabel!
    
    @IBOutlet weak var expandedView: UIView!
    @IBOutlet weak var startDateLbl: UILabel!
    @IBOutlet weak var maturityDateLbl: UILabel!
    @IBOutlet weak var sumAssuredLbl: UILabel!
    @IBOutlet weak var premiumFrequencyLbl: UILabel!
    @IBOutlet weak var lastPremiumLbl: UILabel!
    @IBOutlet weak var nextAmountLbl: UILabel!
    
    var id: String? //to identify cell
    var onToggleExpansion: ((String) -> Void)? //callback function to toggle
    
    //populate data to the UI
    func setupCell(policy: Policy) {
        
        self.id = policy.id
        self.policyNameLbl.text = policy.name
        self.policyNumberLbl.text = policy.number
        self.activeStatusLbl.text = policy.status.displayText
        self.activeStatusLbl.textColor = policy.status.displayText == "Active" ? .systemGreen : .red
        self.premiumDueLbl.text = DateFormatter.display.string(from: policy.nextPremiumDue)
        
        self.startDateLbl.text = DateFormatter.display.string(from: policy.startDate)
        self.maturityDateLbl.text = DateFormatter.display.string(from: policy.maturityDate)
        self.sumAssuredLbl.text = NumberFormatter.currency.string(from: policy.sumAssured as NSNumber)
        self.premiumFrequencyLbl.text = policy.premiumFrequency.displayText
        self.lastPremiumLbl.text = DateFormatter.display.string(from: policy.lastPremiumPaid)
        self.nextAmountLbl.text = NumberFormatter.currency.string(from: policy.nextPremiumAmount as NSNumber)
        self.expandedView.isHidden = !policy.isExpanded

        readMoreButtonAction(policy: policy)
    }
    
    //ReadMore button config
    func readMoreButtonAction(policy: Policy) {
        UIView.transition(with: self.readMoreBtn, duration: 0.3, options: .curveEaseIn, animations: {
            self.readMoreBtn.setTitle(policy.isExpanded ? "Show less" : "Read More", for: .normal)
            self.readMoreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        }, completion: nil)
    }
    
    //ReadMore button action
    @IBAction func readMoreTapped(_ sender: UIButton) {
        if let id = self.id {
            onToggleExpansion?(id)
        }
    }
    
}
