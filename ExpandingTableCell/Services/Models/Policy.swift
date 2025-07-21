//
//  Policy.swift
//  ArtechTest
//
//  Created by Achintha kahawalage on 2025-07-17.
//

import Foundation
import UIKit

// MARK: - Policy Model
struct Policy {
    let id: String
    let name: String
    let number: String
    let status: PolicyStatus
    let nextPremiumDue: Date
    let startDate: Date
    let maturityDate: Date
    let sumAssured: Double
    let premiumFrequency: PremiumFrequency
    let lastPremiumPaid: Date
    let nextPremiumAmount: Double
    var isExpanded: Bool = false
}

enum PolicyStatus {
    case active
    case lapsed
    
    var displayText: String {
        switch self {
        case .active: return "Active"
        case .lapsed: return "Lapsed"
        }
    }
    
    var color: UIColor {
        switch self {
        case .active: return UIColor.systemGreen
        case .lapsed: return UIColor.red
        }
    }
}

enum PremiumFrequency {
    case monthly
    case quarterly
    case halfYearly
    case yearly
    
    var displayText: String {
        switch self {
        case .monthly: return "Monthly"
        case .quarterly: return "Quarterly"
        case .halfYearly: return "Half-Yearly"
        case .yearly: return "Yearly"
        }
    }
}

