//
//  NewsViewController.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit
import JGProgressHUD

class NewsViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet var newsTableView: UITableView!
    
    
    //MARK: - Variables
    private let newsViewModel = NewsViewModel()
    var hud: JGProgressHUD?
    var htmlURL: String?
    
    
    //MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0x151515)
        hud = JGProgressHUD(style: .dark)
        hud?.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        hud?.show(in: view, animated: true)
        newsTableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "newsCell")
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.backgroundColor = .black
        newsTableView.separatorColor = .white
        newsTableView.isHidden = true
        getNews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.title = "News"
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    
    //MARK: - Functions
    private func getNews() {
        newsViewModel.getNews { (state) in
            switch state {
            case .success:
                print("Success")
                DispatchQueue.main.async {
                    self.newsTableView.isHidden = false
                    self.hud?.dismiss(animated: true)
                    self.newsTableView.reloadData()
                }
            case .failure:
                print("Failure")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsToURL" {
            if let webVC = segue.destination as? WebViewController {
                webVC.url = htmlURL
            }
        }
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewModel.newsItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as! NewsCell
        newsCell.contentView.backgroundColor = .black
        let article = newsViewModel.newsItem[indexPath.row]
        newsCell.newsTitleLabel.text = article.title
        newsCell.newsDescriptionLabel.text = article.description
        return newsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNews = tableView.indexPathForSelectedRow
        let news = newsViewModel.newsItem[selectedNews!.row]
        htmlURL = news.url
        self.performSegue(withIdentifier: "newsToURL", sender: self)
    }
    
}



