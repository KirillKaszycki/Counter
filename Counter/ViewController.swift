//
//  ViewController.swift
//  Counter
//
//  Created by Кирилл Кашицкий on 09.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var buttonPlusOne: UIButton!
    @IBOutlet weak var buttonMinusOne: UIButton!
    @IBOutlet weak var buttonReset: UIButton!
    
    @IBOutlet weak var historyTextViewer: UITextView!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.text = "Значение счётчика: \(counter)"
        buttonPlusOne.setTitle("+", for: .normal)
        buttonMinusOne.setTitle("-", for: .normal)
        buttonReset.setTitle("Сброс", for: .normal)
        
        buttonPlusOne.tintColor = .red
        buttonReset.tintColor = .green
        
        historyTextViewer.text = "История изменений:"
        historyTextViewer.isEditable = false // Блокировка возможности редактировать 
    }

    // Логика кнопки +
    @IBAction func plusOnePushed(_ sender: Any) {
        counter += 1
        labelText.text = "Значение счётчика: \(counter)"
        
        logHistory("Значение изменено на +1")
    }
    
    // Логика кнопки -
    @IBAction func minusOnePushed(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            labelText.text = "Значение счётчика: \(counter)"
            logHistory("Значение изменено на -1")
        } else {
            logHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    // Логика кнопки сброса
    @IBAction func resetLabelCounter(_ sender: Any) {
        counter = 0
        labelText.text = "Значение счётчика: \(counter)"
        
        logHistory("Значение сброшено")
    }
    
    // Логика поля истории нажатий
    private func logHistory(_ message: String) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM-yyyy HH:mm"
        let dateString = dateFormater.string(from: Date())
        
        let historyEntry = "\n\(dateString): \(message)"
        historyTextViewer.text.append(historyEntry)
        
        let range = NSMakeRange(historyTextViewer.text.count - 1, 1)
        historyTextViewer.scrollRangeToVisible(range)
    }
    
}

