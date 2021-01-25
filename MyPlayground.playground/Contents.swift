/*
 
 1.Создайте протокол RunningCreature, в котором будут следующие свойства и функции:
 скорость бега (только на чтение)
 количество лап (только на чтение)
 признак бежит ли существо (на чтение и на запись)
 функция бежать
 функция остановиться
 2.Создайте протокол SpeakingCreature, в котором будут следующие свойства и функции:
 голос (низкий / средний / высокий). Только на чтение
 isMuted (лишен ли голоса). На чтение и на запись
 функция замутить
 функция говорить
 3.Создайте сущность Человек со следующим функционалом (подумайте что выбрать перечисление / класс / структура):
 имя (вложенная сущность, в которой есть имя, фамилия и отчество). Невозможно изменить
 возраст. Можно изменить извне после проверки на то, что новое значение возраста не равно текущему и больше нуля.
 признак взрослый ли человек: вычисляемое свойство
 замыкание happyBirthdayAction, которое вызывается после того, как вы установили новое значение возраста. Принимает возраст и ничего не возвращает
 инициализатор, который принимает сущность имени человека. А также проинициализируйте замыкание, которое должно поздравлять человека с днем рождения и его новым возрастом
 
 4. Создайте сущность Animal (подумайте что выбрать перечисление / класс / структура):
 признак isHerbivorous (травоядное животное или нет). Невозможно изменить
 имя. Невозможно изменить
 переменная класса numberOfInstances (примерное количество животных этого типа по всему миру). Доступно к переопределению
 инициализатор для травоядности и имени
 классовая функция вывода информации о животном (все доступные свойства)
 
 5.Создайте сущность Tiger, которая должна реализовывать функционал сущности Animal и подчиняться протоколу RunningCreature
 переопределите свойство numberOfInstances с соответствующим количеством тигров по всему миру
 реализуйте функцию бежать и остановиться . Соответствующие действия выполняются, меняя флаг isRunning, и выводя в консоль информацию о том, что Тигр делает. Обратите внимание, что если тигр уже бежит, то тело функции выполниться не должно. Аналогично и с остановиться
 переопределите функцию вывода информации о классе, добавив туда что-нибудь о Тигре
 реализуйте функцию съесть животное, которое ест животное только если оно не тигр. А если животное умеет бегать (подчиняется RunningCreature), то его скорость бега должна быть меньше скорости тигра. Выведите информацию о том, кого съел Тигр.
 
 6.Создайте сущность Parrot, которая является животным и умеет говорить (подчиняется соответствующему протоколу). Реализуйте все свойства и функции, которые необходимо. Попугай разговаривает, только если он не замючен. И мутиться, только если он до этого был размьючен.
 переопределите свойство numberOfInstances с соответствующим количеством попугаев по всему миру
 7. Создайте сущность Зоопарк. Недоступна к наследованию.
 maxNumberOfAnimals. Неизменяемое свойство
 имя зоопарка. Неизменяемое свойство
 totalNumberOfVisitors. Сколько всего посетителей пришло в зоопарок за всё его время существования. Доступно только для чтения извне. Перед изменением выведите консоль о том как рады вы, что к вам пришли посетители, обратившись к ним по имени.
 массив животных. По умолчанию пустой, недоступен к изменению извне.
 массив посетителей. По умолчанию пустой. Доступен только на чтение извне
 инициализатор с максимальным количеством животных и именем зоопарка
 инициализатор с именем зоопарка. максимальное количество животных - случайное значение.
 функция добавить животное. Добавляет новое животное, только если не превышено maxNumberOfAnimals. Если добавить животное не удалось, то возвращает строку с причиной неуспеха.
 функиция добавить посетителя. Добавляет посетителя.
 функция добавить посетителей. Добавляет несколько посетителей.
 функция удалить всех взрослых из посетителей. Удаляет только тех посетителей, которые старше 18.
 функция удалить всех тигров. Удаляет тигров из массива животных
 функция инфо о зоопарке. Недоступна извне. Выведите информацию о зоопарке, сколько животных в зоопарке, сколько посетителей, сколько всего посетителей было. Функция вызывается каждый раз, когда происходят изменения с животными или посетителями.
 функция покормить львов. Кормит всех львов, которые есть в зоопарке. Еда выбирается случайным образом из массива животных зоопарка.
 8.Создайте разных животных и зоопарк. Создайте посетителей.
 Добавьте животных в зоопарк
 Добавьте в зоопарк посетителей.
 Покормите тигров
 Измените возраст всем посетителям, которым 17 лет.
 Удалите всех взрослых
 Удалите всех тигров
 Пройдитесь по всем животных зоопарка.
 Если это говорящее создание, то заставьте его поговорить
 Если это бегающее создание, то выведите его скорость бега
 Во всех остальных случаях выведите травоядное животное или нет
 
 */

protocol RunningCreature {
    var speed: Int { get }
    var numberOfLegs: Int { get }
    var isRun: Bool { get set }
    
    func run()
    
    func stop()
}

enum Voice {
    case high, middle, low
}
protocol SpeakingCreature {
    var voice: Voice { get }
    var isMuted: Bool { get set }
    
    func mute()
    
    func speak(voice: Voice)
}

class Human {
    struct Name {
        var name: String
        var surname: String
        var patronomic: String
    }
    var age: Int {
        willSet {
            if newValue >= self.age , newValue != 0 {
                self.age = newValue
            }
        }
    }
    var isAdult: Bool {
        willSet {
            if self.age >= 18 {
                self.isAdult == true
            } else {
                self.isAdult == false
            }
        }
    }
    
    let happyBirthdayAction = { (age: Int) -> Void in
        print(age)
    }
    
    init(age: Int, name: Name) {
        self.age = age
        
        
        
    }
}

class Animal {
    
    private(set) var isHerbivorous: Bool
    private var name: String
    var numberOfInstances: Int
    
    init(name: String, isHerbivorous: Bool, numberOfInstances: Int) {
        self.isHerbivorous = isHerbivorous
        self.name = name
        self.numberOfInstances = numberOfInstances
    }
    
    func printInfo() {
        if isHerbivorous == true {
            print("my name is \(self.name), my population is \(self.numberOfInstances) and we eat herb")
        } else {
            print("my name is \(self.name), my population is \(self.numberOfInstances) and we eat meet")
        }
    }
}

class Tiger: Animal, RunningCreature {
    var speed: Int
    
    
    
    var numberOfLegs: Int
    
    var isRun: Bool
    
    
    init(isRun: Bool, numberOfLegs: Int) {
        self.isRun = isRun
        
        self.numberOfLegs = numberOfLegs
        super.isHerbivorous = false
        super.numberOfInstances == numberOfInstances
    }
    
    func run() {
        if isRun == false {
            print("begin running")
        }
    }
    
    func stop() {
        if isRun == true {
            print("stop running")
        }
    }
    
    override func printInfo() {
        print("im a tiger with \(self.numberOfLegs) and i eat meet")
    }
    
    func eatAnimal(speed: Int) {
        if Animal.self != Tiger.self || self.speed > speed {
            print("tiger eat \(Animal.self)")
        }
    }
}
class Parrot: Animal, SpeakingCreature {
    var voice: Voice = .high
    
    var isMuted: Bool = true
    
    
    func mute() {
        if isMuted == true {
            print("Kesha horoshiy")
        } else {
            print("mute")
        }
    }
    
    func speak(voice: Voice) {
        switch voice {
        case .high:
            "kar kar kar"
        case .low:
            "low voice"
        case .middle:
            "chiric chiric"
            
        }
    }
    
    
}

class Zoo {
    var maxNumberOfAnimals: Int
    let name: String = "Super Zoo"
    var totalNumberOfVisitors: Int {
        willSet {
            
        }
    }
    var animals: [Animal] = []
    var visitors: [Human] = []
    
    init(name: String, maxNumberOfAnimals: Int) {
        self.name = name
        self.maxNumberOfAnimals = maxNumberOfAnimals
    }
    init(name: String) {
        self.name = name
        self.maxNumberOfAnimals = 100
    }
    func addAnimal(animal: Animal) {
        if maxNumberOfAnimals < animals.count {
            animals.append(animal)
        } else {
            print("zoo is full")
        }
    }
    
    func addVisitor(visitor: Human) {
        visitors.append(visitor)
    }
    
    func addVisitor(visitor: [Human]) {
        visitors += visitor
    }
    
    func deleteAllAdult(visitor: Human) {
        
        if visitor.isAdult == true {
            visitors.remove(at: <#T##Int#>)//тут нужно с помощью фор ин и с индексом переборку делать, мне кажеся. и потом удалять уже по индексу. из за спешки не сделала
        }
        
        
    }
    
    func deleteTiger(animal: Animal) {
        if animal is Tiger {
            animals.remove(at: animal) // аналогично как и в функции с людьми
        }
    }
    
    func infoAboutZoo() {
        print("zoo name is \(self.name), have \(self.maxNumberOfAnimals) animals, and \(self.totalNumberOfVisitors) visitors.")
    }
    
    func makeEatForLions(animal: Animal) {
        if animal is Animal.Type,  isHerbivorous == false  {
            print("give some meet for lion")
        }
    }
}


let animal1 = Tiger(isRun: true, numberOfLegs: 4)
let animal2 = Parrot(name: "kesha", isHerbivorous: true, numberOfInstances: 2000)
let animal3 = Animal(name: "cat", isHerbivorous: false, numberOfInstances: 10000000)

let human1 = Human(age: 20, name: "john")
let human2 = Human(age: 15, name: "bob")

Zoo.addVisitor(human1)
Zoo.addAnimal(animal2)
Zoo.addAnimal(animal3)
Zoo.addAnimal(animal1)

