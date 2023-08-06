//
//  ChangeNameViewController.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/06.
//

import UIKit

final class ChangeNameViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var underLineView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        setNavigationColor()
        configUI()
        makeBarButtonItem()
    }
    
    private func configUI() {
        nameTextField.font = Font.descriptionFont
        nameTextField.textColor = UIColor(cgColor: Color.titleColor)
        nameTextField.text = UM.userName
        underLineView.backgroundColor = UIColor(cgColor: Color.separatorColor)
    }
    private func makeBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: System.save, style: .plain, target: self, action: #selector(barButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(cgColor: Color.titleColor)
        
    }
    /// 세팅화면으로 넘어가가기
    @objc private func barButtonTapped() {
        guard let text = nameTextField.text, !text.isEmpty else { return }
        UM.userName = text
        navigationController?.popViewController(animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension ChangeNameViewController: UITextFieldDelegate {
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
}
}
