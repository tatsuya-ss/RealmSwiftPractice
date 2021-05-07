//
//  ViewController.swift
//  RealmSwiftPractice
//
//  Created by 坂本龍哉 on 2021/05/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var releaseTextField: UITextField!
    @IBOutlet weak var overviewTextField: UITextField!
    @IBOutlet weak var reviewTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieInfomation()
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        setRealm()
    }
    
    func setRealm() {
        let title = titleTextField.text ?? ""
        let release = releaseTextField.text ?? ""
        let overview = overviewTextField.text ?? ""
        let review = reviewTextField.text ?? ""
        
        let movieInfomations = MovieInfomation()
        movieInfomations.setMovieInfomation(title: title, releaseDay: release, overview: overview, review: review)
        print("保存しました\n\(title)\n\(release)\n\(overview)\n\(review)")
    }
    
    func getMovieInfomation() {
        let movieInfomations = MovieInfomation()
        let movies = movieInfomations.fetchMovieInfomation()
        
        titleTextField.text = movies?.title
        releaseTextField.text = movies?.releaseDay
        overviewTextField.text = movies?.overview
        reviewTextField.text = movies?.review
    }
}


