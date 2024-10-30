//
//  CoffeeVariety.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 31.10.2021.
//

import Foundation

typealias Countries = [CoffeeCountry]

struct CoffeeCountry: Decodable {
    let id: String
    let name: String
    let varieties: [String]

    static func load() -> Countries? {
        do {
            let countries = try JSONDecoder().decode(Countries.self, from: Data(raw.utf8))
            return countries
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

    private static let raw: String = """
    [
        {
            "id": "1",
            "name": "Бразилия",
            "varieties": [
                "Santos",
                "Burbon Santos",
                "Minas",
                "Rio",
                "Canilon",
                "Flat Bit"
            ]
        },
        {
            "id": "2",
            "name": "Columbia",
            "varieties": [
                "Nescafe",
                "Tchibo",
                "Golden Eagle",
                "Jacobs",
                "Moccona",
                "Starbucks"
            ]
        },
        {
            "id": "3",
            "name": "Costa Rica",
            "varieties": [
                "costaRica",
                "burbonSantos",
                "minas",
                "rio",
                "canilon",
                "flatBit"
            ]
        },
        {
            "id": "4",
            "name": "Ямайка",
            "varieties": [
                "yamaica",
                "burbonSantos",
                "minas",
                "rio",
                "canilon",
                "flatBit"
            ]
        },
        {
            "id": "5",
            "name": "Ямайка",
            "varieties": [
                "yamaica",
                "burbonSantos",
                "minas"
            ]
        }
    ]
    """
}

