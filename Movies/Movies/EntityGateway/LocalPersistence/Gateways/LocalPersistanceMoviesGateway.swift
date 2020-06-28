//
//  LocalPersistanceMoviesGateway.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation
import CoreData

protocol LocalPersistenceMoviesGateway: MoviesGateway {
    func add(movie: Movie)
}

class CoreDataMoviesGateway: LocalPersistenceMoviesGateway {
    
    let viewContext: NSManagedObjectContextProtocol
    init(viewContext: NSManagedObjectContextProtocol) {
        self.viewContext = viewContext
    }
    
    func add(movie: Movie) {
        guard let coreDataBook = viewContext.addEntity(withType: CoreDataMovie.self) else {
            return
        }
        
        coreDataBook.populate(with: movie)
        
        do {
            try viewContext.save()
        } catch {
            viewContext.delete(coreDataBook)
        }
    }
    
    func fetchMovies(for type: MovieType, completionHandler: @escaping FetchMoviesEntityGatewayCompletionHandler) {
        if let coreDataMovies = try? viewContext.allEntities(withType: CoreDataMovie.self) {
            let movies = coreDataMovies.map { $0.movie }
            completionHandler(.success(movies))
        } else {
            // completionHandler(.failure(CoreError(message: "Failed retrieving books the data base")))
        }
    }
}
