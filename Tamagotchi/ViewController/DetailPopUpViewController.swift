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
    
    var tamagochiInfo: TamagochiInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }

    private func configUI() {
        guard let tamago = tamagochiInfo else {return}
        tamagoImage.image = Layout.getTamagochiImage(
            type: tamago.tamagochiType,
            level: tamago.level
        )
        nameBackView.backgroundColor = Layout.backgroundColor
        
    }
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
    }
    
}
