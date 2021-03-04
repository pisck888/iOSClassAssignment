/*:Object-Oriented Swift*/
//1.創建Animal class
class Animal {
    let gender: Gender
    
    func eat() {
        print("I eat everything!")
    }
    
    init(gender: Gender) {
        self.gender = gender
    }
}
enum Gender {
    case male
    case female
    case undefined
}

//2.創建Elephant,Tiger,Horse等三個class,繼承Animal class
class Elephant: Animal{
    override func eat() {
        print("I eat banana!")
    }
}
class Tiger: Animal{
    override func eat() {
        print("I eat meat!")
    }
}
class Horse: Animal{
    override func eat() {
        print("I eat grass!")
    }
}

//3.創建Zoo class並修復問題
class Zoo {
    var weeklyHot: Animal //因為三種動物都繼承Animal,所以把type定義成Animal
    init(weeklyHot: Animal){
        self.weeklyHot = weeklyHot
    }
}

let tiger = Tiger(gender: .male)
let elephant = Elephant(gender: .female)
let horse = Horse(gender: .undefined)

let zoo = Zoo(weeklyHot: tiger)
zoo.weeklyHot = elephant
zoo.weeklyHot = tiger
zoo.weeklyHot = horse

/*
 4.What’s the difference between ​Struct​ and ​Class​ ?
 struct是Value Type / class是Reference Type
 struct沒有繼承的功能 / class可以繼承
 struct有一個內建的Initializer / class沒有一定要自己自定義一個init
 
 5.What’s the difference between ​instance method​ and ​type method​ ?
 instance method​是實例方法，實例方法可以存取和修改實例內的其他屬性或方法，但一定需要先創建一個實例以後才可以使用，
 他只能被他所屬的類別的某個特定實例呼叫
 type method是型別方法，要定義type method要在func前面加上class或是static等關鍵字，之後可以使用型別直接呼叫方法，
 不需要真的創建一個實例，型別方法可以直接呼叫類別內的其他型別方法或是存取其他靜態屬性
 
 6.What does ​Initilizer​ do in class and struct ?
 Initilizer​可以看作是為了創建一個實例的特殊方法，目的是為了確保一個實例被創建完成以後所有的屬性都有被賦予初始值，
 以備後續的任務可以順利執行
 
 7.What does ​self​ mean in an instance method and a type method ?
 instance method中的self完全等同於本身這個instance，
 主要使用時機是如果instance method內的某個參數名稱與類別內的某個屬性名稱相同時，
 使用self.屬性名稱來區分類別內的屬性與方法內的參數
 在type method中，self則是代表這個type，而不是代表任何實例，主要使用時機也是為了消除靜態屬性和靜態方法參數之間的歧義
 
 8.What’s the difference between ​reference type​ and ​value type​ ?
 value type​當被賦予到一個變數或是常數時，實際上是產生一份完全一樣的拷貝，
 各個實例基本上是完全獨立的，修改一個實例並不會影響到其他實例
 reference type​在被賦予到一個變數或是常數時，並不是產生一份完全一樣的拷貝，
 而是指向同一個已經存在的實例，不同的變數或常數可看成只是同一個實例不同的名字，
 對某一個reference type​的實例作修改會影響到所有指向他的其他變數或常數
*/

/*:Enumerations ans Optionals in Swift*/
//1.創建Enum
enum Gasoline: String {
    case oli92 = "92" //raw values
    case oli95 = "95"
    case oli98 = "98"
    case diesel = "diesel"
    
    func getPrice() -> Double{
        switch self {
        case .oli92:
            return 25.6
        case .oli95:
            return 27.1
        case .oli98:
            return 29.1
        case .diesel:
            return 22.9
        }
    }
}
print("---enum test---")
print("\(Gasoline.oli92.rawValue) gasoline is cost \(String(Gasoline.oli92.getPrice()))")

//enum associate value
//如果一個enum的case中想要與多個value相關聯或是想要關聯不同type的value，想要儲存或是運用enum裡面的相關聯的資料，
//或是想在產生enum時設定資料，就是使用associate value的好時機，例如以下範例
enum ProductSerialNumber {
    case form1(Int,Int)
    case form2(String)
}
var iphoneSerialNumber: ProductSerialNumber = .form1(001, 123123123)
iphoneSerialNumber = .form2("JSOJFIEMMLKA")

//2.Optional
class Pet {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class People {
    var pet: Pet? = nil
    init() {}
    init(with pet: Pet) {
        self.pet = pet
    }
}
let cat = Pet(name: "Garfield")
let jon = People(with: cat)

//use guard let
func checkpet(){
    guard let pet = jon.pet else {
        print("I don't have a pet.")
        return
    }
    print("I have a pet named \(pet.name).")
}
print("---guard let test---")
checkpet()

//use if let
print("---if let test---")
if let pet = jon.pet{
    print("I have a pet named \(pet.name).")
}else{
    print("I don't have a pet.")
}

/*:Protocol in Swift*/
//1.~6.創建structs and protocols
struct Person: PoliceMan {
    let name: String
    let toolMan: ToolMan
    func arrestCriminals() {
    }
}

protocol PoliceMan {
    func arrestCriminals()
}

protocol ToolMan {
    func fixComputer()
}

struct Engineer: ToolMan {
    func fixComputer() {
    }
}
let engineer = Engineer()
let person = Person(name: "Steven", toolMan: engineer)

/*:Error Handling in Swift*/
enum GuessNumberGameError: Error {
    case wrongNumber
}
class GuessNumberGame {
    var targetNumber = 10
    
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        print("Guess the right number: \(targetNumber)")
    }
}

do{
    let game = GuessNumberGame()
    try game.guess(number: 20)
}catch{
    print("---Error Handling test---")
    print(error)
}
