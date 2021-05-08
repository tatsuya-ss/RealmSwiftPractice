//
//  ViewController.swift
//  RealmSwiftPractice
//
//  Created by 坂本龍哉 on 2021/05/07.
//

import UIKit

struct MovieContent {
    var title: String
    var releaseDay: String
    var overview: String
    var review: String
}

class ViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var releaseTextField: UITextField!
    @IBOutlet weak var overviewTextField: UITextField!
    @IBOutlet weak var reviewTextField: UITextField!
    
    let movieInfomations = MovieInfomation()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let movieInfo = movieInfomations.fetchMovieInfomation() {
            titleTextField.text = movieInfo.title
            releaseTextField.text = movieInfo.releaseDay
            overviewTextField.text = movieInfo.overview
            reviewTextField.text = movieInfo.review
        } else {
            setRealm()
        }
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        saveMovieInfomation()
    }
    
    func saveMovieInfomation() {
        let movieContent = MovieContent(title: titleTextField.text ?? "",
                                        releaseDay: releaseTextField.text ?? "",
                                        overview: overviewTextField.text ?? "",
                                        review: reviewTextField.text ?? "")
        movieInfomations.saveMovieInfomation(movieContent: movieContent)
        print("saveしました\(movieContent.title)")
    }
    
    func setRealm() {
        let movieContent = MovieContent(title: titleTextField.text ?? "",
                                        releaseDay: releaseTextField.text ?? "",
                                        overview: overviewTextField.text ?? "",
                                        review: reviewTextField.text ?? "")
        movieInfomations.setMovieInfomation(movieContent: movieContent)
        print("初期setしました\(movieContent.title)")
    }
}


