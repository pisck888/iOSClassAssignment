/*:Assignment1:Git&GitHub*/

/*2.git名詞與指令解釋
git status : 用來查看目前位於哪個分支,與伺服器上的哪個分支同步,所有檔案各處在什麼樣的狀態下
git add : 把一個檔案加入開始追蹤的行列,或是把一個修改過後的檔案重新預存,準備下次commit
git commmit : 把現在預存區所有預存的檔案提交,git會對現在所有放在預存區的檔案作一個快照,讓之後可以用來復原或是比對
git log : 用來查看一個有commit許多次的專案或是從網路clone有包含以往紀錄的專案以往所有commit歷史紀錄
git push [Repo_name][Branch_name] : 將本地某個名稱的分支推送到伺服器上指定名稱的版本庫
git remote -v : 檢視目前已設定連接好的遠端版本庫,會顯示出簡稱同時利用-v來顯示讀寫這些遠端時所用的網址
git branch : 顯示目前所有的分支列表,同時顯示目前自己所在的分支
fork : 從別人的帳號下把一個專案完整的複製到自己的帳號底下,對於這個複製的專案有完全的讀寫權限,之後也可以用pull request功能把專案合併回原本的帳號
*/

//3.Please describe how to establish a github repo and how to upload the local projectsto github. Try to explain it as detail as possible.
//在本地端建立好自己要使用版本管理的專案資料夾後,使用終端機進入資料夾位置並使用指令git init初始化使專案開始接受版本管理
//把編輯好或是準備要接受追蹤的檔案使用git add指令加入到預存區準備在適當的時機或進度commit專案
//使用git status查看目前檔案的狀態,在確定目前進度都完成沒有未追蹤或是未預存的檔案,想要留下一個版本紀錄點時使用git commit指令提交檔案
//在GitHub網站上創建一個新的repo,並在終端機使用git remote add [簡稱][URL]的方式來連結本地與遠端的版本庫
//本地端commit完成後,使用git push [Repo_name][Branch_name]的指令把本地專案上傳到伺服器上

/*:Basic*/
//1.宣告一個常數Pi
let Pi: Double = 3.14

//2.宣告兩個常數並計算他們的平均值
let x: Int = 5
let y: Int = 10
let average = (x + y)/2

//3.把Int資料轉換為Double資料
let newAverage = (Double(x) + Double(y)) / 2.0
//(10/3)會得出Int型別,而且只會取到整數的部分,小數點以下會被無條件捨去得到答案3
//(10.0/3.0)會得出Double型別,可以計算小數點以下的部分,可得到包含小數點較精確的答案3.333333

//4.確認下列變數常數的型別
var flag: Bool = true
var inputString: String = "Hello world."
let bitsInBite: Int = 8
let averageScore: Double = 86.8

//5.宣告一個salary並把他加上28000
var salary = 22000
salary += 28000

//6.Equality operator
5 == 5

//7.宣告兩個常數並把他們取餘數
let a = 10 , b = 3
let remain = a % b

//8.變數與常數有什麼不同
//let是用來宣告常數的,常數被賦予值以後不能修改,var是用來宣告變數的,變數賦予值以後還可以修改,如不需要改變的數值盡量使用let來宣告使用的儲存空間比較小也比較有效率

//9.命名的方法與一些潛規則
//命名時盡量使用清楚明瞭的單字讓大家知道這個常數或變數是幹麻的
//第一個單字的首字母以小寫表示其餘單字首字母以大寫表示(lower camel case)
//名字之後可以加上:來指定型別,如有初始值則可省略指定型別交由swift自行推斷

//10.Type Inference是什麼
//Type Inference - 型別推斷,如果宣告一個常數或變數時沒有指定他的型別,因為等號左右兩邊的型別必須要一致,所以swift會自動根據指派給他的值去作推斷並指定他的型別

//11.以下程式碼有什麼問題
var phoneNumber = 0987654321
//phoneNumber = "Hello world." 此物件型別為Int,之後無法再把String型別的資料指定給他


/*:Collection*/
//1.創建型別為String的空陣列
var myFriends = [String]()

//2.添加資料
myFriends = ["Ian", "Bomi", "Kevin"]

//3.添加資料在最尾端
myFriends.append("Michael")

//4.調動資料順序
myFriends.swapAt(2, 0)

//5.用for迴圈印出陣列資料
print("---friends array---")
for friends in myFriends{
    print(friends)
}

//6.取出陣列裡面index為5的資料
//myFriends[5] 會出現error,因為myFriends陣列裡只有4個值,index分別為0~3,沒有index是5的值,index out of range無法執行

//7.取得陣列排頭的資料
myFriends.first

//8.取得陣列結尾的資料
myFriends.last

//9.創建一個型別為[String:Int]的字典
var myCountryNumber = [String:Int]()

//10.為字典添加資料
myCountryNumber = ["US":1, "GB":44, "JP":81]

//11.改變字典中的資料
myCountryNumber["GB"] = 0

//12.創建空的字典
let emptyDictionary = [Int:Int]()

//13.移除字典內的資料
myCountryNumber["US"] = nil


/*:Control Flow*/
//1.用for迴圈印出陣列最後三個值
let lottoNumbers = [10,9,8,7,6,5]
print("---last three number---")
for i in 3...5{
    print(lottoNumbers[i])
}

//2.用for迴圈與倒轉陣列印出結果
print("---for result 1---")
let reverseLottoNumbers = Array(lottoNumbers.reversed())
for i in 0...reverseLottoNumbers.count-1{
    print(reverseLottoNumbers[i])
}
print("---for result 2---")
for i in 0...lottoNumbers.count-1{
    if i % 2 == 0{
        print(lottoNumbers[i])
    }
}

//3.使用while迴圈印出與上一題一樣的結果
var count = 0
print("---while result 1---")
while count<reverseLottoNumbers.count {
    print(reverseLottoNumbers[count])
    count += 1
}
print("---while result 2---")
count = 0
while count<lottoNumbers.count {
    print(lottoNumbers[count])
    count += 2
}

//4.使用repeat-while迴圈印出與第二題相同的結果
print("---repeat-while result 1---")
count = 0
repeat{
    print(reverseLottoNumbers[count])
    count += 1
}while count<reverseLottoNumbers.count
print("---repeat-while result 2---")
count = 0
repeat{
    print(lottoNumbers[count])
    count += 2
}while count<lottoNumbers.count

//5.while與repeat-while的差異
//while是前測試迴圈,要先判斷條件為true才會進行裡面的程式碼
//repeat-while是後測試迴圈,不論如何都會先執行一次repeat裡面的程式碼,才會去判斷while後面的條件有沒有成立,條件為true才會再執行repeat迴圈裡面的程式碼

//6.if判斷式
print("---if statement---")
var isRaining = true
if isRaining{
    print("It's raining, I don't want to work today.")
}else{
    print("Although it's sunny,I still don't want to work today.")
}

//7.switch判斷式
print("---switch statement---")
var jobLevel = 4
switch jobLevel {
case 1:
    print("Member")
case 2:
    print("Team Leader")
case 3:
    print("Manager")
case 4:
    print("Director")
default:
    print("We don't have this job")
}


/*:Function*/
//1.宣告一個greet function
func greet(person name: String) -> String{
    return "Hello, \(name)"
}
greet(person: "Celeste")

//2.宣告一個multiply function,有兩個參數,其中一個參數預設b=10
print("---multiply function---")
func multiply(a:Int, b:Int=10){
    print(a*b)
}
multiply(a: 5)

//3.argument lable和parameter的差異
//argument lable是外部參數名,是當我們呼叫一個方法時會顯示出來的參數名字,主要是為了提高可讀性與維護效率
//parameter是內部參數名,主要是用在function內部,如果在寫內部的程式碼時也使用外部參數名可能會變得很奇怪難以理解,故把他們分開使用

//4.以下兩個方法各回傳什麼樣的型別
func birthday()->String{
    return "5月27號" //此方法回傳一個String type
}
func payment()->Double{
    return 100.0 //此方法回傳一個Double type
}

//End 辛苦了,感謝Wayne老師的耐心批改與指教～
