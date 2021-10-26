//
//  CreateGroupViewController.swift
//  goyotashi
//
//  Created by Akihiro Kokubo on 2021/10/26.
//

import UIKit
import ReactorKit

final class CreateGroupViewController: UIViewController, View, ViewConstructor {

    // MARK: - Variables
    var disposeBag = DisposeBag()

    // MARK: - Views
    private let scrollView = UIScrollView().then {
        $0.alwaysBounceVertical = true
    }

    private let groupNameLabel = UILabel().then {
        $0.apply(fontStyle: .regular, size: 15, color: Color.gray01)
        $0.text = "グループ名"
    }

    private let groupNameTextField = UITextField().then {
        $0.placeholder = "グループ名を入力"
        $0.font = UIFont(name: FontStyle.bold.rawValue, size: 18)
        $0.adjustsFontSizeToFitWidth = true
    }

    // MARK: - Lify Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupViewConstraints()
    }

    // MARK: - Setup Methods
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(groupNameLabel)
        scrollView.addSubview(groupNameTextField)
    }

    func setupViewConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        groupNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.left.equalToSuperview().inset(16)
        }
        groupNameTextField.snp.makeConstraints {
            $0.top.equalTo(groupNameLabel.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(16)
            $0.width.equalTo(DeviceSize.screenWidth - 32)
        }
    }

    // MARK: - Bind Method
    func bind(reactor: CreateGroupReactor) {
        // Action

        // State
    }
}
