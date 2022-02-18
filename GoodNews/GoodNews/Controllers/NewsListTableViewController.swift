//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Aleksei Danilov on 18.02.2022.
//

import Foundation
import UIKit

final class NewsListTableViewController: UITableViewController {
    // MARK: - Properties
    private let articleListViewModel: ArticleListViewModel
    
    // MARK: - Init
    init(articleListViewModel: ArticleListViewModel) {
        self.articleListViewModel = articleListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        articleListViewModel.getData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - UITableView methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleViewModel = articleListViewModel.articleAtIndex(indexPath.row)
        cell.configure(articleViewModel)
        return cell
    }
}

// MARK: - Setup
private extension NewsListTableViewController {
    private func setup() {
        setupTableView()
        setupNavigation()
        setupAppearance()
    }
    
    private func setupTableView() {
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleTableViewCell")
        tableView.estimatedRowHeight = 144
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "GoodNews"
    }
    
    private func setupAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
