//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Александр Востриков on 05.02.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let photosLabel = UILabel()
    private let arrowButton = UIButton()
    private let firstPhoto = UIImageView()
    private let secondPhoto = UIImageView()
    private let thirdPhoto = UIImageView()
    private let fourthPhoto = UIImageView()
    var photos: [UIImage]? {
        didSet{
            guard let tempatePhoto = UIImage(systemName: "photo") else { return }
            firstPhoto.image = photos?[0] ?? tempatePhoto
            secondPhoto.image = photos?[1] ?? tempatePhoto
            thirdPhoto.image = photos?[2] ?? tempatePhoto
            fourthPhoto.image = photos?[3] ?? tempatePhoto
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.addSubviews(photosLabel, arrowButton, firstPhoto, secondPhoto, thirdPhoto, fourthPhoto)
    }
    
    private func configureView(){
        // MARK: photosLabel
        photosLabel.text = "Photos"
        photosLabel.textColor = .black
        photosLabel.font = .systemFont(ofSize: 24, weight: .bold)
        photosLabel.toAutoLayout()
        
        // MARK: arrowButton
        arrowButton.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        arrowButton.tintColor = .black
        arrowButton.toAutoLayout()
        
        // MARK: imagePhoto
        firstPhoto.layer.cornerRadius = 6
        firstPhoto.clipsToBounds = true
        firstPhoto.toAutoLayout()
        
        secondPhoto.layer.cornerRadius = 6
        secondPhoto.clipsToBounds = true
        secondPhoto.toAutoLayout()
        
        thirdPhoto.layer.cornerRadius = 6
        thirdPhoto.clipsToBounds = true
        thirdPhoto.toAutoLayout()
        
        fourthPhoto.layer.cornerRadius = 6
        fourthPhoto.clipsToBounds = true
        fourthPhoto.toAutoLayout()
    }
    
    private func configureConstraints(){
        
        let constraints = [
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: Constants.leadingMarginForPhotosLabel),
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                             constant: Constants.topMarginForPhotosLabel),
            photosLabel.trailingAnchor.constraint(lessThanOrEqualTo: arrowButton.leadingAnchor,
                                                  constant: Constants.screenWeight - 100),
            
            arrowButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowButton.topAnchor.constraint(equalTo: contentView.topAnchor,
                                             constant: Constants.topMarginForArrowButton),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                  constant: Constants.trailingMarginForArrowButton),
            
            firstPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: Constants.leadingMarginForFirstPhoto),
            firstPhoto.topAnchor.constraint(equalTo: photosLabel.bottomAnchor,
                                            constant: Constants.topMarginForFirstPhoto),
            firstPhoto.trailingAnchor.constraint(equalTo: secondPhoto.leadingAnchor,
                                                 constant: Constants.trailingMarginForFirstPhoto),
            firstPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                               constant: Constants.bottomForFirstPhoto),
            firstPhoto.widthAnchor.constraint(equalToConstant: (Constants.screenWeight - 48) / 4),
            firstPhoto.heightAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            
            secondPhoto.topAnchor.constraint(equalTo: firstPhoto.topAnchor),
            secondPhoto.trailingAnchor.constraint(equalTo: thirdPhoto.leadingAnchor,
                                                  constant: Constants.trailingMarginForSecondPhoto),
            secondPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                constant: Constants.bottomForSecondPhoto),
            secondPhoto.widthAnchor.constraint(equalToConstant: (Constants.screenWeight - 48) / 4),
            secondPhoto.heightAnchor.constraint(equalTo: secondPhoto.widthAnchor),
            
            thirdPhoto.topAnchor.constraint(equalTo: firstPhoto.topAnchor),
            thirdPhoto.trailingAnchor.constraint(equalTo: fourthPhoto.leadingAnchor,
                                                 constant: Constants.trailingMarginForThirdPhoto),
            thirdPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                               constant: Constants.bottomForThirdPhoto),
            thirdPhoto.widthAnchor.constraint(equalToConstant: (Constants.screenWeight - 48) / 4),
            thirdPhoto.heightAnchor.constraint(equalTo: thirdPhoto.widthAnchor),
            
            fourthPhoto.topAnchor.constraint(equalTo: firstPhoto.topAnchor),
            fourthPhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                  constant: Constants.trailingMarginForFourthPhoto),
            fourthPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                constant: Constants.bottomForFourthPhoto),
            fourthPhoto.widthAnchor.constraint(equalToConstant: (Constants.screenWeight - 48) / 4),
            fourthPhoto.heightAnchor.constraint(equalTo: fourthPhoto.widthAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}