//
//  TitleTableViewCell.swift
//  TableViewProgrammatic
//
//  Created by Vanesa Korbenfeld on 31/01/2022.
//
import UIKit

class TitleTableViewCell: UITableViewCell {
    static let titleTableViewCellReuseIdentifier = "titleTableViewCellReuseIdentifier"
    lazy var titleLabel = createTitleLabel()
    
    func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.textAlignment = .left
        label.textColor = .black
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
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
}
