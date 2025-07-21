//
//  PolicyService.swift
//  ArtechTest
//
//  Created by Achintha kahawalage on 2025-07-17.
//

import UIKit

class PolicyService {
    static let shared = PolicyService() // used singleton for API service
    private init() {}
    
    func fetchPolicies() -> [Policy] {
        let calendar = Calendar.current
        let today = Date()
        
        return [
            Policy(
                id: "1",
                name: "Life Insurance Premium",
                number: "LI-2024-001",
                status: .active,
                nextPremiumDue: calendar.date(byAdding: .day, value: 15, to: today)!,
                startDate: calendar.date(byAdding: .year, value: -2, to: today)!,
                maturityDate: calendar.date(byAdding: .year, value: 18, to: today)!,
                sumAssured: 500000,
                premiumFrequency: .monthly,
                lastPremiumPaid: calendar.date(byAdding: .month, value: -1, to: today)!,
                nextPremiumAmount: 1250.00
            ),
            Policy(
                id: "2",
                name: "Health Insurance Plus",
                number: "HI-2023-045",
                status: .active,
                nextPremiumDue: calendar.date(byAdding: .day, value: 30, to: today)!,
                startDate: calendar.date(byAdding: .year, value: -1, to: today)!,
                maturityDate: calendar.date(byAdding: .year, value: 4, to: today)!,
                sumAssured: 100000,
                premiumFrequency: .quarterly,
                lastPremiumPaid: calendar.date(byAdding: .month, value: -3, to: today)!,
                nextPremiumAmount: 875.00
            ),
            Policy(
                id: "3",
                name: "Term Life Protection",
                number: "TL-2022-112",
                status: .lapsed,
                nextPremiumDue: calendar.date(byAdding: .day, value: -10, to: today)!,
                startDate: calendar.date(byAdding: .year, value: -3, to: today)!,
                maturityDate: calendar.date(byAdding: .year, value: 12, to: today)!,
                sumAssured: 750000,
                premiumFrequency: .yearly,
                lastPremiumPaid: calendar.date(byAdding: .year, value: -1, to: today)!,
                nextPremiumAmount: 2400.00
            )
        ]
    }
}
