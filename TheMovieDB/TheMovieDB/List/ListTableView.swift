//
//  UIListTableView.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class ListTableView : UITableView, List {
    
    // MARK: Properties
    weak var listDelegate : ListDelegate?
    let tableRowHeight = 90
    let cellIdentifier = "ListTableViewCell"
    
    init(frame: CGRect) {
        super.init(frame: frame, style: .plain)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func reloadAllData() {
        self.reloadData()
    }
}


extension ListTableView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listDelegate!.numberOfCells()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListTableViewCell else{
            print("error")
            return UITableViewCell()
        }
        listDelegate?.configureCell(cell: cell, index: indexPath.row)
        cell.isHidden = false
        cell.isOpaque = true
        //cell.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        //cell.title.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}

private extension ListTableView {
    func configure() {
        register(ListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        dataSource = self
    }
}
