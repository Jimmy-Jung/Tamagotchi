//
//  DetailPopUpViewController.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit

final class DetailPopUpViewController: UIViewController {

    @IBOutlet weak var tamagoImage: UIImageView!
    @IBOutlet weak var nameBackView: UIView!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var separatorLineView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var buttonSeparatorLineView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
    }
    
}
