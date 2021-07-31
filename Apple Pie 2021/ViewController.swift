//
//  ViewController.swift
//  Apple Pie 2021
//
//  Created by Владимир on 28.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    //MARK: - Properties
    var currectGame: Game! /// ! - значение опциональное но мы с ним работаем как будто оно имеет значение. Т.е мы уверенны когда к корректгейм обратимся у нас там будут значения т.е мы сначала присвоим потом будем использовать. Не проверяет значение. Минус в том если значения не будет то вылетит в процессе исполнения а не во время компеляции.
    let incorrectMovesAllowed = 7
    var listofWords = [
        "Александрия",
        "Атланта",
        "Ахмедабад",
        "Багдад",
        "Бангалор",
        "Бангкок",
        "Барселона",
        "Белу-Оризонти",
        "Богота",
        "Буэнос-Айрес",
        "Вашингтон",
        "Гвадалахара",
        "Гонконг",
        "Гуанчжоу",
        "Дакка",
        "Даллас",
        "Далянь",
        "Дар-эс-Салам",
        "Дели",
        "Джакарта",
        "Дунгуань",
        "Йоханнесбург",
        "Каир",
        "Калькутта",
        "Карачи",
        "Киншаса",
        "Куала Лумпур",
        "Лагос",
        "Лахор",
        "Лима",
        "Лондон",
        "Лос-Анджелес",
        "Луанда",
        "Мадрид",
        "Майами",
        "Манила",
        "Мехико",
        "Москва",
        "Мумбаи",
        "Нагоя",
        "Нанкин",
        "Нью-Йорк",
        "Осака",
        "Париж",
        "Пекин",
        "Пуна",
        "Рио-де-Жанейро",
        "Сан-Паулу",
        "Санкт-Петербург",
        "Сантьяго",
        "Сеул",
        "Сиань",
        "Сингапур",
        "Стамбул",
        "Сурат",
        "Сучжоу",
        "Тегеран",
        "Токио",
        "Торонто",
        "Тяньцзинь",
        "Ухань",
        "Филадельфия",
        "Фошань",
        "Фукуока",
        "Хайдарабад",
        "Ханчжоу",
        "Харбин",
        "Хартум",
        "Хошимин",
        "Хьюстон",
        "Цзинань",
        "Циндао",
        "Ченнай",
        "Чикаго",
        "Чунцин",
        "Чэнду",
        "Шанхай",
        "Шэньчжэнь",
        "Шэньян",
        "Эр-Рияд",
        "Янгон",
    ].shuffled()
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
        newRound()
    }
    }
    
    // MARK: - Methods
    
    func enableButtons(_ enable: Bool = true) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func newRound() {
        guard !listofWords.isEmpty else {
            enableButtons(false)
            updateUI()
            return
        }
        let newWord = listofWords.removeFirst()
        currectGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
            updateUI()
        enableButtons()
    }
    
    func updateCorrectWordLabel() {
        var displayWord = [String]()
        for letter in currectGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: " ")
    }
    
    func updateState () {
        if currectGame.incorrectMovesRemaining < 1 {
            totalLosses += 1
        } else if currectGame.guessedWord == currectGame.word {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func updateUI() {
        let movesRemaining = currectGame.incorrectMovesRemaining
        let imageNumber = (movesRemaining + 64) % 8 /// movesRemaining < 0 ? 0 : movesRemaining < 8 ? movesRemaining : 7 второй вариант, ? - то : - иначе
        let image = "Tree\(imageNumber)"
        treeImageView.image = UIImage(named: image)
        updateCorrectWordLabel()
        scoreLabel.text = "Выигрыши: \(totalWins), Проигрыши: \(totalLosses)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }


    
  // MARK: - IB Action
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        currectGame.playerGussed(letter: Character(letter))
        updateState() /// обновление
    }
    
}

