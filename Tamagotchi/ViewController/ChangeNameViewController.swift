//
//  ChangeNameViewController.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/06.
//

import UIKit

final class ChangeNameViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
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
        nameTextField.textColor = Color.titleColor
        nameTextField.text = UM.userName
        underLineView.backgroundColor = Color.separatorColor
        errorLabel.text = ""
    }
    private func makeBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: System.save, style: .plain, target: self, action: #selector(barButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = Color.titleColor
        
    }
    /// 세팅화면으로 넘어가가기
    @objc private func barButtonTapped() {
        guard let text = nameTextField.text, !text.isEmpty else { return }
        if text.count > 1, text.count < 7 {
            UM.userName = text
            navigationController?.popViewController(animated: true)
        } else {
            errorLabel.shake(
                shakeText: System.numberOfTextError,
                durationTime: 3,
                textWillDisappear: true,
                prepareHandler: { [weak self] in
                    self?.nameTextField.text = ""
                }
            )
        }
        
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
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.errorLabel.text = ""
    }
}
