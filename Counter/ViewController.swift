//
//  ViewController.swift
//  Counter
//
//  Created by Кирилл Кашицкий on 09.01.2024.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var labelText: UILabel!
    @IBOutlet weak private var plusOneButton: UIButton!
    @IBOutlet weak private var minusOneButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var historyTextView: UITextView!
    
    // Счётчик для labelText
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.text = "Значение счётчика: \(counter)"
        plusOneButton.setTitle("+", for: .normal)
        minusOneButton.setTitle("-", for: .normal)
        resetButton.setTitle("Сброс", for: .normal)
        
        plusOneButton.tintColor = .red
        resetButton.tintColor = .green
        
        historyTextView.text = "История изменений:"
        historyTextView.isEditable = false // Блокировка возможности редактировать 
    }
    
    // Логика поля истории нажатий
    private func logHistory(_ message: String) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM-yyyy HH:mm"
        let dateString = dateFormater.string(from: Date())
        
        // Добавление текста на экран
        let historyEntry = "\n\(dateString): \(message)"
        historyTextView.text.append(historyEntry)
        
        let range = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(range)
    }

    // Логика кнопки +
    @IBAction private func plusOnePushed(_ sender: Any) {
        counter += 1
        labelText.text = "Значение счётчика: \(counter)"
        
        logHistory("Значение изменено на +1")
    }
    
    // Логика кнопки -
    @IBAction private func minusOnePushed(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            labelText.text = "Значение счётчика: \(counter)"
            logHistory("Значение изменено на -1")
        } else {
            logHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    // Логика кнопки сброса
    @IBAction private func resetLabelCounter(_ sender: Any) {
        counter = 0
        labelText.text = "Значение счётчика: \(counter)"
        logHistory("Значение сброшено")
    }
}

