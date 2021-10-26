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

    private let groupMemberLabel = UILabel().then {
        $0.apply(fontStyle: .regular, size: 15, color: Color.gray01)
        $0.text = "グループのメンバー"
    }

    private let privacyTitleLabel = UILabel().then {
        $0.apply(fontStyle: .regular, size: 15, color: Color.gray01)
        $0.text = "公開／非公開"
    }

    private let privacyStateLabel = UILabel().then {
        $0.apply(fontStyle: .bold, size: 19, color: Color.gray01)
        $0.text = "公開する"
    }

    private let privacySwitch = UISwitch()

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
        scrollView.addSubview(groupMemberLabel)
        scrollView.addSubview(privacyTitleLabel)
        scrollView.addSubview(privacyStateLabel)
        scrollView.addSubview(privacySwitch)
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
        groupMemberLabel.snp.makeConstraints {
            $0.top.equalTo(groupNameTextField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(16)
        }
        privacyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(groupMemberLabel.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(16)
        }
        privacyStateLabel.snp.makeConstraints {
            $0.top.equalTo(privacyTitleLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().inset(16)
        }
        privacySwitch.snp.makeConstraints {
            $0.centerY.equalTo(privacyStateLabel)
            $0.right.equalTo(groupNameTextField)
        }
    }

    // MARK: - Bind Method
    func bind(reactor: CreateGroupReactor) {
        // Action

        // State
    }
}