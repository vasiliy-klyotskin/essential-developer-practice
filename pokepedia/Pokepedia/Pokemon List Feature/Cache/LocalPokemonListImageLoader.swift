//
//  LocalPokemonListImageLoader.swift
//  Pokepedia
//
//  Created by Василий Клецкин on 8/3/23.
//

import Foundation

public protocol PokemonListImageStore {
    func retrieveImage(for url: URL) throws -> Data?
    func insertImage(data: Data, for url: URL) throws
}

public final class LocalPokemonListImageLoader {
    private let store: PokemonListImageStore

    public init(store: PokemonListImageStore) {
        self.store = store
    }
    
    public enum LoadError: Error {
        case failed
        case notFound
    }
    
    public func loadImageData(from url: URL) throws -> Data {
        if let data = try store.retrieveImage(for: url) {
            return data
        } else {
            throw LoadError.notFound
        }
    }
    
    public func save(_ data: Data, for url: URL) throws {
        try store.insertImage(data: data, for: url)
    }
}
