//
//  JoinGroupViewController.swift
//  goyotashi
//
//  Created by Akihiro Kokubo on 2021/10/30.
//

import UIKit
import ReactorKit

final class JoinGroupViewController: UIViewController, View, ViewConstructor {

    // MARK: - Variables
    var disposeBag = DisposeBag()

    // MARK: - Views
    private let closeButton = UIButton().then {
        $0.setImage(R.image.close(), for: .normal)
    }

    private let scrollView = UIScrollView().then {
        $0.alwaysBounceVertical = true
    }

    private let invitationCodeTitleLabel = UILabel().then {
        $0.apply(fontStyle: .regular, size: 15, color: Color.gray01)
        $0.text = "招待コード"
    }

    private let invitationCodeTextField = UITextField().then {
        $0.placeholder = "招待コードを入力"
        $0.font = UIFont(name: FontStyle.bold.rawValue, size: 18)
        $0.adjustsFontSizeToFitWidth = true
    }

    private let joinButton = UIButton().then {
        $0.titleLabel?.apply(fontStyle: .medium, size: 16)
        $0.setTitle("グループに参加する", for: .normal)
        $0.setTitleColor(Color.blue, for: .normal)
        $0.setTitleColor(Color.blue.withAlphaComponent(0.3), for: .highlighted)
    }

    private let activityIndicatorView = UIActivityIndicatorView()

    private let doneImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = R.image.check()
    }

    // MARK: - Lify Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupViewConstraints()
    }

    // MARK: - Setup Methods
    func setupViews() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: closeButton)

        view.addSubview(scrollView)
        scrollView.addSubview(invitationCodeTitleLabel)
        scrollView.addSubview(invitationCodeTextField)
        scrollView.addSubview(joinButton)
        scrollView.addSubview(activityIndicatorView)
        scrollView.addSubview(doneImageView)
    }

    func setupViewConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        invitationCodeTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.left.equalToSuperview().inset(16)
        }
        invitationCodeTextField.snp.makeConstraints {
            $0.top.equalTo(invitationCodeTitleLabel.snp.bottom).offset(8)
            $0.left.right.equalTo(view).inset(16)
        }
        joinButton.snp.makeConstraints {
            $0.top.equalTo(invitationCodeTextField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(16)
            $0.height.equalTo(32)
            $0.width.equalTo(160)
        }
        activityIndicatorView.snp.makeConstraints {
            $0.centerY.equalTo(joinButton)
            $0.right.equalTo(view).inset(32)
        }
        doneImageView.snp.makeConstraints {
            $0.center.equalTo(activityIndicatorView)
            $0.size.equalTo(24)
        }
    }

    // MARK: - Bind Method
    func bind(reactor: JoinGroupReactor) {
        // Action
        closeButton.rx.tap
            .bind { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }
            .disposed(by: disposeBag)

        invitationCodeTextField.rx.text
            .distinctUntilChanged()
            .map { Reactor.Action.updateInvitationCode($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        // State
    }
}
