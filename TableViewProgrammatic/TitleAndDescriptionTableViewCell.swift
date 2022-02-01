//
//  TitleAndDescriptionTableViewCell.swift
//  TableViewProgrammatic
//
//  Created by Vanesa Korbenfeld on 01/02/2022.
//

import UIKit

class TitleAndDescriptionTableViewCell: UITableViewCell {
    static let titleAndDescriptionTableViewCellReuseIdentifier = "titleAndDescriptionTableViewCellReuseIdentifier"
    lazy var titleLabel = createTitleLabel()
    lazy var descriptionLabel = createDescriptionLabel()
    
    func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }
    
    func createDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitleTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented.")
    }
    
    func setupTitleTableViewCell() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
    }
}


