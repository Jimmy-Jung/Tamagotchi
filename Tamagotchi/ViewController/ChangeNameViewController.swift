//
//  ChangeNameViewController.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/06.
//

import UIKit

final class ChangeNameViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var underLineView: UIView!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        setNavigationColor()
        configUI()
        makeBarButtonItem()
    }
    // MARK: - ConfigurationUI Methods

    private func configUI() {
        nameTextField.font = LT_Font.descriptionFont
        nameTextField.textColor = LT_Color.titleColor
        nameTextField.text = UM.userName
        underLineView.backgroundColor = LT_Color.separatorColor
        errorLabel.text = ""
        errorLabel.font = LT_Font.errorLabelFont
    }
    private func makeBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: LT_System.save, style: .plain, target: self, action: #selector(barButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = LT_Color.titleColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    // MARK: - Action Methods

    /// 세팅화면으로 넘어가가기
    @objc private func barButtonTapped() {
        guard let text = nameTextField.text, !text.isEmpty else { return }
        if text.count > 1, text.count < 7 {
            UM.userName = text
            navigationController?.popViewController(animated: true)
        } else {
            errorLabel.shake(
                shakeText: LT_System.numberOfTextError,
                durationTime: 3,
                textWillDisappear: true,
                prepareHandler: { [weak self] in
                    self?.nameTextField.text = ""
                }
            )
        }
        
    }
}

// MARK: - TextField Delegate

extension ChangeNameViewController: UITextFieldDelegate {
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
}
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.errorLabel.text = ""
    }
}
