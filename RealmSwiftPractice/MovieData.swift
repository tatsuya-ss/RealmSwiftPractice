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
    func setMovieInfomation(title: String, releaseDay: String, overview: String, review: String)
    func fetchMovieInfomation() -> Movie?
}

struct MovieInfomation : MovieRepository {

    func setMovieInfomation(title: String, releaseDay: String, overview: String, review: String) {
        let myMovie = Movie()
        let realm = try! Realm()

        myMovie.title = title
        myMovie.releaseDay = releaseDay
        myMovie.overview = overview
        myMovie.review = review
        
        try! realm.write {
            realm.add(myMovie)
        }
        let displayMovie = realm.objects(Movie.self).first
        
        try! realm.write {
            displayMovie?.title = title
            displayMovie?.releaseDay = releaseDay
            displayMovie?.overview = overview
            displayMovie?.review = review
        }
        print("realmに保存しました\n\(myMovie.title)\n\(myMovie.releaseDay)\n\(myMovie.overview)\n\(myMovie.review)")
        print(Realm.Configuration.defaultConfiguration.fileURL!)

    }
    
    func fetchMovieInfomation() -> Movie? {
        let realm = try! Realm()

        let movie = realm.objects(Movie.self).first
        return movie
    }
}


