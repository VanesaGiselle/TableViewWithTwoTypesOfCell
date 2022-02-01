//
//  ViewController.swift
//  TableViewProgrammatic
//
//  Created by Vanesa Korbenfeld on 27/01/2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableview = UITableView(frame: .zero)
    let titleAndDescriptionArray = [Item(typeOfCell: .title, title: "Titulo", description: "descripcion"), Item(typeOfCell: .titleAndDescription, title: "Titulo", description: "descripcion")]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.titleTableViewCellReuseIdentifier)
        tableview.register(TitleAndDescriptionTableViewCell.self, forCellReuseIdentifier: TitleAndDescriptionTableViewCell.titleAndDescriptionTableViewCellReuseIdentifier)
        tableview.dataSource = self
        tableview.delegate = self
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            tableview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleAndDescriptionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let position = indexPath.row
        
        let typeOfCell = titleAndDescriptionArray[position].typeOfCell
        
        switch typeOfCell {
        case .title:
            let cell: TitleTableViewCell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.titleTableViewCellReuseIdentifier, for: indexPath) as! TitleTableViewCell
            cell.titleLabel.text = titleAndDescriptionArray[indexPath.row].title
            return cell
        case .titleAndDescription:
            let cell: TitleAndDescriptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: TitleAndDescriptionTableViewCell.titleAndDescriptionTableViewCellReuseIdentifier, for: indexPath) as! TitleAndDescriptionTableViewCell
            cell.titleLabel.text = titleAndDescriptionArray[indexPath.row].title
            cell.descriptionLabel.text = titleAndDescriptionArray[indexPath.row].description
            return cell
        default:
            assertionFailure("No se encontro el tipo de celda.")
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {

}

struct Item {
    let typeOfCell: TypeOfCellView
    let title: String
    let description: String
}

enum TypeOfCellView {
    case title
    case titleAndDescription
}


