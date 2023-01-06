//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 28.11.2021.
//

import UIKit
import StorageService

final class FeedViewController: UIViewController {
    
    private var coordinator: FeedCoordinator
    
    private let post = Post(author: "Post", description: "Post", image: "bars", likes: 1, views: 1)
    private let tabBarItemLocal = UITabBarItem(title: "Feed",
                                       image: UIImage(systemName: "f.circle.fill"),
                                       tag: 0)
    
    private let buttonToPostFirst = UIButton()
    private let buttonToPostSecond = UIButton()
    
    private let stackView = UIStackView()
    
    init(coordinator: FeedCoordinator){
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = tabBarItemLocal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButtons()
        setupStack()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor =  .green
        self.navigationItem.title = "Feed"
    }
    
    private func setupButtons(){
        buttonToPostFirst.toAutoLayout()
        buttonToPostSecond.toAutoLayout()
        buttonToPostFirst.backgroundColor = .red
        buttonToPostFirst.layer.cornerRadius = 10
        buttonToPostFirst.setTitle("First button", for: .normal)
        buttonToPostFirst.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        buttonToPostSecond.backgroundColor = .blue
        buttonToPostSecond.layer.cornerRadius = 10
        buttonToPostSecond.setTitle("Second button", for: .normal)
        buttonToPostSecond.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    private func setupStack(){
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(buttonToPostFirst)
        stackView.addArrangedSubview(buttonToPostSecond)
        view.addSubview(stackView)
    }
    
    private func setupConstraints(){
        let constraints = [
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func pressed(){
        coordinator.showPostVC(post: post)
    }
}
