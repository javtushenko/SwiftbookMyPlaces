//
//  RatingControl.swift
//  MyPlaces
//
//  Created by Николай Явтушенко on 13.01.2022.
//

import UIKit

class RatingControl: UIStackView {
    
    
    // MARK: Properties
    
    var rating = 0 {
        didSet {
            updateButtonSelectionState()
        }
    }
    
    private var ratingButtons = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0)
    @IBInspectable var starCount: Int = 5
    
    
    // MARK: Initialization
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    
    // MARK: Button Action
    
    @objc func ratingButtonTapped(button: UIButton) {
        
        guard let index = ratingButtons.firstIndex(of: button) else { return }
        
        // Вычисляем рейтинг в зависимости от нажатой кнопки
        
        let selectedRaiting = index + 1
        
        if selectedRaiting == rating {
            rating = 0
        } else {
            rating = selectedRaiting
        }
        
    }
    
    
    // MARK: Private Metods
    
    private func setupButtons() {
        
        // Загружаем изображения кнопок
        let filledStar = UIImage(named: "filledStar")
        let emptyStar = UIImage(named: "emptyStar")
        let highlightedStar = UIImage(named: "highlightedStar")
        
        
        
        for _ in 0..<starCount {
            
            // Создаем кнопку
            let button = UIButton()
            
            // Устанавливаем изображение кнопки в зависимости от состояния
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Добавляем констрейнты
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Задаем action кнопки
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Добавляем кнопку в Stack View
            addArrangedSubview(button)
            
            // Добавляем кнопку в массив
            ratingButtons.append(button)
        }
        updateButtonSelectionState()
    }
    
    private func updateButtonSelectionState() {
        
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
    
    
}
