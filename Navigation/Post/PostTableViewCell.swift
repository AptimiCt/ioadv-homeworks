//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Александр Востриков on 30.01.2022.
//

import UIKit
import iOSIntPackage
import StorageService

class PostTableViewCell: UITableViewCell {
    
    var post: Post? {
        didSet{
            guard let author = post?.author else { return }
            authorLabel.text = author
            guard let image = post?.image else { return }
            guard let sourceImage = UIImage(named: image) else { return }
            let imageProcessor = ImageProcessor()
            let filter = ColorFilter.AllCases().randomElement() ?? .sepia(intensity: 3)
            imageProcessor.processImage(sourceImage: sourceImage, filter: filter) { image in
                postImageView.image = image
            }
            descriptionLabel.text = post?.description
            guard let likes = post?.likes else { return }
            likesLabel.text = String(format: ~K.Likes.Keys.likes.rawValue, likes)
            guard let views = post?.views else { return }
            viewsLabel.text = String(format: ~K.Views.Keys.views.rawValue, views)
        }
    }
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    let postImageView: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let description = UILabel()
        description.toAutoLayout()
        description.font = .systemFont(ofSize: 14)
        description.textColor = .systemGray
        description.numberOfLines = 0
        return description
    }()
    
    let likesLabel: UILabel = {
        let likes = UILabel()
        likes.toAutoLayout()
        likes.font = .systemFont(ofSize: 16)
        likes.numberOfLines = 0
        likes.textColor = .black
        return likes
    }()
    
    let viewsLabel: UILabel = {
        let views = UILabel()
        views.toAutoLayout()
        views.font = .systemFont(ofSize: 16)
        views.numberOfLines = 0
        views.textColor = .black
        return views
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        configureConstraints()
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(addPostToFavorite))
                doubleTap.numberOfTapsRequired = 2
                self.addGestureRecognizer(doubleTap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func addPostToFavorite(){
        guard let post else { return }
        CoreDataManager.dataManager.addPost(post: post)
    }
}

extension PostTableViewCell {
    private func setupViews(){
        contentView.addSubviews(authorLabel, postImageView, descriptionLabel, likesLabel, viewsLabel)
    }
    
    private func configureConstraints(){
        
        let constraints: [NSLayoutConstraint] = [
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: Constants.leadingMarginForAuthorLabel),
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                             constant: Constants.topMarginForAuthorLabel),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                  constant: Constants.trailingMarginForAuthorLabel),
            authorLabel.bottomAnchor.constraint(equalTo: postImageView.topAnchor, constant: Constants.bottomForAuthorLabel),
            
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.widthAnchor.constraint(equalToConstant: Constants.screenWeight),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                      constant: Constants.leadingMarginForDescriptionLabel),
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor,
                                                  constant: Constants.topMarginForDescriptionLabel),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.trailingMarginForDescriptionLabel),
            descriptionLabel.bottomAnchor.constraint(equalTo: likesLabel.topAnchor, constant: Constants.bottomForDescriptionLabel),
            
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leadingMarginForLikesLabel),
            likesLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewsLabel.leadingAnchor, constant: Constants.trailingMarginForLikesLabel),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.bottomForLikesLabel),
            likesLabel.widthAnchor.constraint(lessThanOrEqualToConstant: Constants.screenWeight / 2 - 48),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.topMarginForViewsLabel),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: Constants.trailingMarginForViewsLabel),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.bottomForViewsLabel),
            viewsLabel.widthAnchor.constraint(lessThanOrEqualToConstant: Constants.screenWeight / 2 - 48),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
