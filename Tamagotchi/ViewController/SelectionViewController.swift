//
//  SelectionViewController.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit

final class SelectionViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet weak var tamagotchiCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    private var tamagoList: [TamagotchiInfo] = []
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationColor()
        setupLayout()
        setupCollectionView()
        configCollectionView()
        fetchList()
    }
    
    // MARK: - Methods
    
    private func setupLayout() {
    }
    
    /// 컬렉션뷰 세팅
    private func setupCollectionView() {
        tamagotchiCollectionView.delegate = self
        tamagotchiCollectionView.dataSource = self
        let nib = UINib(nibName: TamagotchiCollectionViewCell.identifier, bundle: nil)
        tamagotchiCollectionView.register(nib, forCellWithReuseIdentifier: TamagotchiCollectionViewCell.identifier)
    }
    
    /// 컬렉션뷰 구성
    private func configCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 18
        let inset: CGFloat = 18
        let width = UIScreen.main.bounds.width - (spacing * 2) - (inset * 2)
        layout.itemSize = CGSize(width: width/3, height: width/3 + 24)
        layout.sectionInset = UIEdgeInsets(
            top: spacing,
            left: inset,
            bottom: spacing,
            right: inset
        )
        tamagotchiCollectionView.collectionViewLayout = layout
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.scrollDirection = .vertical
        layout.collectionView?.backgroundColor =  Color.backgroundColor
        tamagotchiCollectionView.collectionViewLayout = layout
    }
    private func fetchList() {
        let defaultsTamagoList = DefaultsTamagotchiList.defaultTamagotchiList
        tamagoList.append(contentsOf: defaultsTamagoList)
        for _ in 1...20 {
            tamagoList.append(
                TamagotchiInfo(
                    tamagotchiType: .none,
                    name: LocalizedString.Name.none,
                    level: 1,
                    feedingCount: 1,
                    wateringCount: 1
                )
            )
        }
    }
}

// MARK: - CollectionView Delegate

extension SelectionViewController: UICollectionViewDelegate {
    
}
// MARK: - CollectionView Datasource

extension SelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TamagotchiCollectionViewCell.identifier, for: indexPath) as! TamagotchiCollectionViewCell
        cell.tamagotchiInfo = tamagoList[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: DetailPopupViewController.identifier) as! DetailPopupViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        vc.tamagotchiInfo = tamagoList[indexPath.item]
        present(vc, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
}
