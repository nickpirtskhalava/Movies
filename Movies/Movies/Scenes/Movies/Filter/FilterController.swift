//
//  FilterController.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit


protocol FilterControllerDelegate: class {
    func filterControllerDidSelect(category: MovieCategory)
}

class FilterController: UITableViewController {
    
    var category: MovieCategory!
    @IBOutlet var cells: [UITableViewCell]!
    weak var delegate: FilterControllerDelegate?
    
    static func storyBoardInstance(with selectedCategory: MovieCategory) -> FilterController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "FilterController") as! FilterController
            vc.category = selectedCategory
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = cells[category.rawValue]
            cell.accessoryType = .checkmark
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.filterControllerDidSelect(category: MovieCategory.init(rawValue: indexPath.row)!)
        self.dismiss(animated: true, completion: nil)
    }
}
