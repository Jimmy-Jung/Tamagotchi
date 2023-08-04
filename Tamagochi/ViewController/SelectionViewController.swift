//
//  SelectionViewController.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit

final class SelectionViewController: UIViewController {

    @IBOutlet weak var tamagochiCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupCollectionView()
    }
    
    private func setupLayout() {
        view.backgroundColor = Layout.backgroundColor
    }
    
    private func setupCollectionView() {
        tamagochiCollectionView.delegate = self
        tamagochiCollectionView.dataSource = self
    }

}
// MARK: - CollectionView Delegate

extension SelectionViewController: UICollectionViewDelegate {
    
}
// MARK: - CollectionView Datasource

extension SelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
