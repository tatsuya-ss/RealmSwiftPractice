//
//  MovieData.swift
//  RealmSwiftPractice
//
//  Created by 坂本龍哉 on 2021/05/07.
//

import Foundation
import RealmSwift

class Movie: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var releaseDay: String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var review: String = ""
}

protocol MovieRepository {
    func setMovieInfomation(movieContent: MovieContent)
    func fetchMovieInfomation() -> Movie?
    func saveMovieInfomation(movieContent: MovieContent)
}

struct MovieInfomation : MovieRepository {
    func saveMovieInfomation(movieContent: MovieContent) {
        let realm = try! Realm()
        let myMovie = realm.objects(Movie.self).first
        
        try! realm.write {
            myMovie?.title = movieContent.title
            myMovie?.releaseDay = movieContent.releaseDay
            myMovie?.overview = movieContent.overview
            myMovie?.review = movieContent.review
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    

    func setMovieInfomation(movieContent: MovieContent) {
        let myMovie = Movie()
        let realm = try! Realm()

        myMovie.title = movieContent.title
        myMovie.releaseDay = movieContent.releaseDay
        myMovie.overview = movieContent.overview
        myMovie.review = movieContent.review
        
        try! realm.write {
            realm.add(myMovie)
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)

    }
    
    func fetchMovieInfomation() -> Movie? {
        let realm = try! Realm()
        if let movie = realm.objects(Movie.self).first {
            return movie
        }
        return nil
    }
}


