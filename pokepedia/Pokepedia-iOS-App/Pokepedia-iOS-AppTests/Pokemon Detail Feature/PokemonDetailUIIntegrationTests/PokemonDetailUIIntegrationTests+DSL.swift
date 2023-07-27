//
//  PokemonDetailUIIntegrationTests+DSL.swift
//  Pokepedia-iOS-AppTests
//
//  Created by Василий Клецкин on 7/26/23.
//

import UIKit
@testable import Pokepedia_iOS

extension DetailPokemonInfoCell {
    var nameText: String? {
        nameLabel.text
    }
    
    var idText: String? {
        idLabel.text
    }
    
    var genusText: String? {
        genusLabel.text
    }
    
    var flavorText: String? {
        flavorLabel.text
    }
}

extension DetailPokemonAbilityCell {
    var titleText: String? {
        titleLabel.text
    }
    
    var subtitleText: String? {
        subtitleLabel.text
    }
    
    var damageClassText: String? {
        damageClassLabel.text
    }
    
    var typeText: String? {
        typeLabel.text
    }
}

extension ListViewController {
    func pokemonDetailInfoView() -> UIView? {
        tableView.dataSource?.tableView(tableView, cellForRowAt: .init(row: 0, section: detailSectionNumber))
    }
    
    func pokemonDetailAbilityView(for index: Int) -> UIView? {
        tableView.dataSource?.tableView(tableView, cellForRowAt: .init(row: index + 1, section: detailSectionNumber))
    }
    
    func numberOfRenderedAbilities() -> Int {
        if let numberOfRows = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: detailSectionNumber), numberOfRows != 0 {
            return numberOfRows - 1
        } else {
            return 0
        }
    }
    
    var detailSectionNumber: Int { 0 }
}