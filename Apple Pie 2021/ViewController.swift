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
    @IBOutlet weak var coorectWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    //MARK: - Properties
    var currectGame: Game! /// ! - значение опциональное но мы с ним раработаем как будто оно имеет значение. Т.е мы уверенны когда к корректгейм обратимся у нас там будут значения т.е мы сначала присвоим потом будем использовать. Не проверяет значение. Минус в том если значения не будет то вылетит в процессе исполнения а не во время компеляции.
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
    ]
    var totalWins = 0
    var totalLosses = 0
    
    // MARK: - Methods
    
    func newRound() {
        let newWord = listofWords.removeFirst()
        currectGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateUI() {
        let movesRemaining = currectGame.incorrectMovesRemaining
        let image = "Tree\(movesRemaining < 8 ? movesRemaining : 7)" /// ? - то
        treeImageView.image = UIImage(named: image)
        scoreLabel.text = "Выигрыши: \(totalWins), Проигрыши: \(totalLosses)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }


    
  // MARK: - IB Action
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
}

