//
//  ToDoCell.swift
//  ToDo App
//
//  Created by Hiba on 12/23/22.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    static let reuseidentifier = "todoCellIdentifier"
    
    var todoLabel = UILabel(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUi()
        setLayout()
        
        print("Testing")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUi() {
        
       
        
        todoLabel.translatesAutoresizingMaskIntoConstraints = false
        todoLabel.text = "New"
        todoLabel.numberOfLines = 0
        todoLabel.textColor = .red
        todoLabel.backgroundColor = .blue
        
        contentView.addSubview(todoLabel)
    }
    
    func setLayout() {
        
        NSLayoutConstraint.activate([
                                        todoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                        todoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
        
    }
    
    func loadContent() {
        todoLabel.text = "Test item"
    }
    
}
