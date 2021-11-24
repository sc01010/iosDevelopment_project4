//
//  PeopleCollectionViewCell.swift
//  sc2796_p5
//
//  Created by Steven Chen on 10/28/21.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {
    private var peopleImageView = UIImageView()
    private var peopleNameLabel = UILabel()
    private var peopleTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        peopleImageView.translatesAutoresizingMaskIntoConstraints = false
        peopleImageView.contentMode = .scaleAspectFit
        contentView.addSubview(peopleImageView)
        
        peopleNameLabel.translatesAutoresizingMaskIntoConstraints = false
        peopleNameLabel.adjustsFontSizeToFitWidth = true
        peopleNameLabel.textColor = .black
        peopleNameLabel.textAlignment = .center
        peopleNameLabel.font = .systemFont(ofSize: 14)
        contentView.addSubview(peopleNameLabel)
        
        peopleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        peopleTitleLabel.adjustsFontSizeToFitWidth = true
        peopleTitleLabel.textColor = .black
        peopleTitleLabel.textAlignment = .center
        peopleTitleLabel.font = .systemFont(ofSize: 12)
        contentView.addSubview(peopleTitleLabel)
        
        setupConstraints()
    }
    
    func configure(for person: Person) {
        peopleImageView.image = person.image
        peopleNameLabel.text = person.name
        peopleTitleLabel.text = person.title
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            peopleImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            peopleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            peopleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            peopleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            peopleImageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            peopleImageView.widthAnchor.constraint(equalToConstant: 60),
            peopleImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            peopleNameLabel.topAnchor.constraint(equalTo: peopleImageView.bottomAnchor, constant: 5),
            peopleNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            peopleNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            peopleNameLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        NSLayoutConstraint.activate([
            peopleTitleLabel.topAnchor.constraint(equalTo: peopleNameLabel.bottomAnchor),
            peopleTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            peopleTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            peopleTitleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
