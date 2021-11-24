//
//  FiltersCollectionViewCell.swift
//  sc2796_p5
//
//  Created by Steven Chen on 10/28/21.
//

import UIKit

class FiltersCollectionViewCell: UICollectionViewCell {
    private var filterLabel = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.adjustsFontSizeToFitWidth = true
        filterLabel.textColor = .black
        filterLabel.textAlignment = .center
        filterLabel.font = .systemFont(ofSize: 12)
        filterLabel.layer.borderWidth = 2
        filterLabel.layer.borderColor = CGColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
        filterLabel.layer.cornerRadius = 8
        contentView.addSubview(filterLabel)
        
        setupContraints()
    }
    
    func configure(for filter: Filter) {
        filterLabel.backgroundColor = filter.isSelected ? .systemTeal : .clear
        filterLabel.text = filter.filterName
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            filterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            filterLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            filterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            filterLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            filterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
