//
//  MainViewController.swift
//  SocialNetworkApp
//
//  Created by Matvei Khlestov on 08.04.2024.
//

import UIKit

// MARK: - MainViewController
final class MainViewController: UIViewController {
    
    // MARK: - UI Elements
    private lazy var personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .person
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 40
        
        setFrameFor(
            mainView: view,
            configView: imageView,
            widthPercentage: 0.861,
            heightPercentage: 0.4,
            offsetY: 0.1
        )
        
        return imageView
        
    }()
    
    private lazy var badgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .badge
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var iconButtons: [UIButton] = {
        let buttons = [
            IconButton(image: .instagram),
            IconButton(image: .tiktok),
            IconButton(image: .vkontakte)
        ]
        
        return buttons
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton()
        setFrameFor(
            mainView: view, configView: button,
            widthPercentage: 0.1511627907,
            heightPercentage: 0.0698060489336407,
            offsetY: 0 - 0.17,
            offsetX: 0.166
        )
        
        button.backgroundColor = .appGray
        button.setImage(.cross, for: .normal)
        
        return button
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        setFrameFor(
            mainView: view, configView: button,
            widthPercentage: 0.1511627907,
            heightPercentage: 0.0698060489336407,
            offsetY: 0 - 0.17,
            offsetX: 0 - 0.166
        )
        
        button.backgroundColor = .appGray
        button.setImage(.heart, for: .normal)
        
        return button
    }()
    
    private lazy var writeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .appGreen
        button.setTitle("Написать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 20
        
        setFrameFor(
            mainView: view, configView: button,
            widthPercentage: 0.482,
            heightPercentage: 0.0537,
            offsetY: 0 - 0.17
        )
        
        return button
    }()
    
    private lazy var iconButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: iconButtons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        
        setFrameFor(
            mainView: personImageView, configView: stackView,
            widthPercentage: 0.34,
            heightPercentage: 0.09,
            offsetY: 0.39,
            offsetX: 0.24
        )
        
        
        return stackView
    }()
    
    private lazy var fullNameInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            fullNameLabel, badgeImageView
        ])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        
        return stackView
    }()
    
    private lazy var personInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            fullNameInfoStackView ,ageLabel
        ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 3
        
        setFrameFor(
            mainView: personImageView, configView: stackView,
            widthPercentage: 0.493,
            heightPercentage: 0.09,
            offsetY: 0 - 0.32,
            offsetX: 0.15
        )
        
        return stackView
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(.more, for: .normal)
        
        setFrameFor(
            mainView: personImageView, configView: button,
            widthPercentage: 0.135,
            heightPercentage: 0.134,
            offsetY: 0.39,
            offsetX: 0 - 0.34
        )
        
        return button
    }()
    
    private lazy var fullNameLabel: UILabel = {
        createLabel(text: "Имя Фамилия")
    }()
        
    private lazy var ageLabel: UILabel = {
        createLabel(text: "25 лет")
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        crossButton.layer.cornerRadius = crossButton.frame.width / 2
        heartButton.layer.cornerRadius = heartButton.frame.width / 2
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func setupView() {
        view.backgroundColor = .white
        addSubviews()
        setupNavigationController()
    }
    
    func addSubviews() {
        setupSubviews(
            personImageView,
            writeButton,
            crossButton,
            heartButton
        )
        
        setupSubviewsForPersonImageView(
            iconButtonsStackView,
            moreButton,
            personInfoStackView
        )
    }
    
    func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    func setupSubviewsForPersonImageView(_ subviews: UIView... ) {
        for subview in subviews {
            personImageView.addSubview(subview)
        }
    }
    
    func setupNavigationController() {
        title = "AppName"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }
}

// MARK: - Frame
private extension MainViewController {
    func setFrameFor(mainView: UIView,
                     configView: UIView,
                     widthPercentage: CGFloat,
                     heightPercentage: CGFloat,
                     offsetY : CGFloat,
                     offsetX: CGFloat? = nil) {
        
        let screenWidth = mainView.frame.width
        let screenHeight = mainView.frame.height
        
        // Вычисляем размеры configView
        let viewWidth = screenWidth * widthPercentage
        let viewHeight = screenHeight * heightPercentage
        
        // Вычисляем координаты X и Y для размещения configView по центру экрана
        let viewX = (screenWidth - viewWidth) / 2 - screenHeight * (offsetX ?? 0)
        let viewY = (screenHeight - viewHeight) / 2 - screenHeight * offsetY
        
        // Устанавливаем фрейм configView
        configView.frame = CGRect(x: viewX, y: viewY, width: viewWidth, height: viewHeight)
    }
}

