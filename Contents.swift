
import Cocoa


class Bank
{
    var nameOfBank: String
    
    
    init()
    {
        nameOfBank = "";
    }
    
    init(nameOfBank: String)
    {
        self.nameOfBank = nameOfBank;
    }
    
    func welcome(nameOfBank: String)
    {
        print("Welcome to the \(nameOfBank) bank");
        
    }
    
    func giveTransactionHistory()
    {
        print("Successful Transaction");
    }
    
}

class Client: Bank
{
    
    var name: String
    var address: String
    var age: Int
    var dob: String
    var gender: String
    
    override init()
    {
        name = "";
        address = "";
        age = 0;
        dob = "";
        gender = "";
        super.init();
    }
    
    init(name: String, address: String, age: Int, dob: String, gender: String, nameOfBank: String)
    {
        self.name = name;
        self.address = address;
        self.age = age;
        self.dob = dob;
        self.gender = gender;
        super.init(nameOfBank: nameOfBank);
    }
    
    override func welcome(nameOfBank: String)
    {
        
    }
    
    func changeProfile(newName: String, newAddress: String)
    {
        self.name = newName;
        self.address = newAddress;
        print("Updated name: \(name), Address: \(address)");
    }
    
}


class Account: Bank
{
    var type: String;
    var accountNumber = arc4random()
    var balance: Double = 0;
    var initialBalance:Double = 0;
    
    override init()
    {
        type = "";
        super.init();
    }
    
    init(type: String, nameOfBank: String, balance: Double)
    {
        self.type = type;
        super.init(nameOfBank: nameOfBank);
    }
    
    enum accountTypes{
        case Chequing
        case Saving
    }
    
    func createAccount(accountType: accountTypes)
    {
        var caseAccount = accountTypes.Chequing
        
        switch caseAccount
        {
        case .Chequing:
            initialBalance = 100;
            print("Hey! Your chequing account is created:")
            print("Account# is CHE\(accountNumber)");
            print("Initial Balance:\(initialBalance)")
        case .Saving:
            initialBalance = 200;
            print("Hey! Your saving account is created:")
            print("Account# is SAV\(accountNumber)");
            print("Initial Balance:\(initialBalance)")
        default:
            initialBalance = 50;
            print("Hey! Your personal account is created:")
            print("Account# is SAV\(accountNumber)");
            print("Initial Balance:\(initialBalance)")
        }
        
    }
    
    
    func deposit(amountToDeposit: Double)
    {
        balance = initialBalance + amountToDeposit;
        print("Amount deposited \(amountToDeposit)")
        totalBalance()
    }
    
    func withdrawal(amountToWithdraw: Double)
    {
        if amountToWithdraw > balance
        {
            print("You can't withdraw this amount! Balance is less");
        }
            
        else
        {
            balance = balance - amountToWithdraw
            print("Withdrawal Done of amount \(amountToWithdraw)!")
            totalBalance()
        }
        
    }
    
    func totalBalance()
    {
        print("Total balance is \(balance)");
    }
    
}



var bank = Bank();
bank.welcome(nameOfBank: "RBC");

var client = Client(name: "Ekta", address: "Woodbridge", age: 23, dob: "09-10-1995", gender: "Female",nameOfBank: "RBC");
print("Name: \(client.name), Address: \(client.address), Age:  \(client.age), Date of birth: \(client.dob), Gender: \(client.gender), Bank name: \(client.nameOfBank)");

client.welcome(nameOfBank: "Scotiabank");
print("Want to change your name and address?")
client.changeProfile(newName: "Kavita", newAddress: "Vaughan");


var accountInstance = Account();
var caseAccount = Account.accountTypes.Chequing
accountInstance.createAccount(accountType: caseAccount)
accountInstance.deposit(amountToDeposit: 2500)
accountInstance.withdrawal(amountToWithdraw: 1000)

