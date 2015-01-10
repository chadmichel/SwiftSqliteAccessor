//
//  DetailViewController.swift
//  SqliteTest3
//
//  Created by Chad Michel on 1/3/15.
//  Copyright (c) 2015 Chad Michel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: QuestionSet? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if self.detailItem != nil {
            if let label = self.detailDescriptionLabel {
                label.text = self.detailItem!.title
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

