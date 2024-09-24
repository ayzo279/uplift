//
//  CountryCodeModel.swift
//  uplift
//
//  Created by Andy Zhuo on 9/24/24.
//

import Foundation

struct CountryCodeModel: Hashable {
    var flagEmoji: String
    var code: String
    var country: String
}

// Example country data
let countries = [
    CountryCodeModel(flagEmoji: "🇺🇸", code: "+1", country: "United States"),
    CountryCodeModel(flagEmoji: "🇬🇧", code: "+44", country: "United Kingdom"),
    CountryCodeModel(flagEmoji: "🇨🇦", code: "+1", country: "Canada")
    // Add more countries as needed
]

