//
//  InviteMemberCell.swift
//  goyotashi
//
//  Created by Akihiro Kokubo on 2021/10/27.
//

import UIKit
import ReactorKit
import Kingfisher

final class InviteMemberCell: UICollectionViewCell, View, ViewConstructor {

    struct Const {
        static let imageViewSize: CGFloat = 44
        static let cellWidth: CGFloat = DeviceSize.screenWidth
        static let cellHeight: CGFloat = 60
        static let itemSize: CGSize = CGSize(width: cellWidth, height: cellHeight)
    }

    // MARK: - Variables
    var disposeBag = DisposeBag()

    // MARK: - Views
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = R.image.dish()
        $0.layer.cornerRadius = Const.imageViewSize / 2
        $0.layer.masksToBounds = true
    }

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
        setupViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Methods
    func setupViews() {
        contentView.addSubview(imageView)
    }

    func setupViewConstraints() {
        imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(16)
            $0.size.equalTo(Const.imageViewSize)
        }
    }

    // MARK: - Bind Method
    func bind(reactor: OrganizeRestaurantCellReactor) {
        // Action

        // State
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
