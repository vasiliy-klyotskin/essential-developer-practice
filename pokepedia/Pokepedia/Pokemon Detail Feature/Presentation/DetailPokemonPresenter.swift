//
//  DetailPokemonPresenter.swift
//  Pokepedia
//
//  Created by Василий Клецкин on 7/25/23.
//

import Foundation

public enum DetailPokemonPresenter {
    public static func map<Color>(
        model: DetailPokemon,
        colorMapping: (String) -> Color
    ) -> DetailPokemonViewModel<Color> {
        let abilities = model.abilities.map {
            DetailPokemonAbilityViewModel(
                title: $0.title,
                subtitle: $0.subtitle,
                damageClass: $0.damageClass,
                damageClassColor: colorMapping($0.damageClassColor),
                type: $0.type,
                typeColor: colorMapping($0.typeColor)
            )
        }
        return .init(
            info: .init(
                imageUrl: model.info.imageUrl,
                id: model.info.id,
                name: model.info.name,
                genus: model.info.genus,
                flavorText: model.info.flavorText
            ),
            abilities: abilities
        )
    }
}
