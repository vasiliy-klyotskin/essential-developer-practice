//
//  PokemonListUIIntegrationTests+DSL.swift
//  Pokepedia-iOS-AppTests
//
//  Created by Василий Клецкин on 5/31/23.
//

import UIKit
@testable import Pokepedia_iOS

extension ListPokemonItemCell {
    var specialTypeNameText: String? {
        specialTypeLabel.text
    }
    
    var mainTypeNameText: String? {
        physicalTypeLabel.text
    }
    
    var nameText: String? {
        nameLabel.text
    }
    
    var idText: String? {
        idLabel.text
    }
    
    var isLoading: Bool {
        activityIndicator.isAnimating
    }
    
    var isReloadControlShown: Bool {
        !reloadButton.isHidden
    }
    
    var renderedImage: Data? {
        pokemonIconView.image?.pngData()
    }
    
    func simulateReload() {
        onReload?()
        // TODO: Tests crushes when I call this method although there are not troubles in setting selector to the button. Fix it
        // reloadButton.simulate(event: .touchUpInside)
    }
}

extension ListViewController {
    private var pokemonListSectionNumber: Int { 0 }
    private var loadMoreSectionNumber: Int { 1 }
    
    func numberOfRenderedListImageViews() -> Int {
        numberOfRows(in: pokemonListSectionNumber)
    }
    
    func renderedListImageData(at index: Int) -> Data? {
        return simulatePokemonListItemViewVisible(at: index)?.renderedImage
    }
    
    var canLoadMore: Bool {
        loadMoreListCell() != nil
    }
    
    var isShowingLoadMoreListIndicator: Bool {
        return loadMoreListCell()?.isLoading == true
    }
    
    var loadMoreFeedErrorMessage: String? {
        return loadMoreListCell()?.message
    }
    
    func numberOfRenderedListPokemons() -> Int {
        tableView.dataSource?.tableView(tableView, numberOfRowsInSection: pokemonListSectionNumber) ?? -1
    }
    
    @discardableResult
    func simulatePokemonListItemViewVisible(at index: Int) -> ListPokemonItemCell? {
        listPokemonItemView(at: index) as? ListPokemonItemCell
    }
    
    func listPokemonItemView(at index: Int) -> UIView? {
        tableView.dataSource?.tableView(tableView, cellForRowAt: .init(row: index, section: pokemonListSectionNumber))
    }
    
    func simulateTapOnLoadMoreListError() {
        let delegate = tableView.delegate
        let index = IndexPath(row: 0, section: loadMoreSectionNumber)
        delegate?.tableView?(tableView, didSelectRowAt: index)
    }
    
    func simulateLoadMoreListAction() {
        guard let view = loadMoreListCell() else { return }
        
        let delegate = tableView.delegate
        let index = IndexPath(row: 0, section: loadMoreSectionNumber)
        delegate?.tableView?(tableView, willDisplay: view, forRowAt: index)
    }
    
    private func loadMoreListCell() -> LoadMoreCell? {
        cell(row: 0, section: loadMoreSectionNumber) as? LoadMoreCell
    }
}