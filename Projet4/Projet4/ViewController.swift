//
//  ViewController.swift
//  Projet4
//
//  Created by Lion on 02/03/2023.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    @IBOutlet weak var currentView: UIView!

    func createView()
    {
        let rect = CGRect(x: 62, y: 220, width: 300, height: 300)
        let layout = UIView(frame: rect)
        layout.translatesAutoresizingMaskIntoConstraints = false
        layout.backgroundColor = .blue
        currentView.addSubview(layout)
        let constrain = currentView.constraints
    }
}
