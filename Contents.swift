
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
    var account: Account;
    var pin: Int = 0;
    
    override init()
    {
        name = "";
        address = "";
        age = 0;
        dob = "";
        gender = "";
        account = Account();
        pin = 1234;
        super.init();
    }
    
    init(name: String, address: String, age: Int, dob: String, gender: String, nameOfBank: String, account: Account)
    {
        self.name = name;
        self.address = address;
        self.age = age;
        self.dob = dob;
        self.gender = gender;
        self.account = account;
        super.init(nameOfBank: nameOfBank);
    }
    
    override func welcome(nameOfBank: String)
    {
        
    }
    
    func changeName(newName: String)
    {
        self.name = newName;
        print("Updated name: \(name)");
    }
    
    func changeAddress(newAddress: String)
    {
        self.address = newAddress;
        print("Updated address: \(address)");
    }
    
    func changePin(newPin: Int)
    {
        self.pin = newPin;
        print("Updated pin: \(pin)");
    }
    
    
    
}


class Account
{
    var type: String;
    var accountNumber = arc4random()
    var balance: Double = 0;
    var initialBalance:Double = 0;
    var overdraftProtector: Bool ;
    
    init()
    {
        type = "";
        overdraftProtector = false;
    }
    
    init(type: String, balance: Double, overdraftProtector: Bool)
    {
        self.type = type;
        self.overdraftProtector = overdraftProtector;
    }
    
    enum accountTypes{
        case Chequing
        case Saving
    }
    
    var caseAccount = accountTypes.Chequing
    
    func createAccount(accountType: accountTypes) -> Bool
    {
        var overdraftStatus = overdraftProtector;
        switch caseAccount
        {
        case .Chequing:
            initialBalance = 100;
            print("Hey! Your chequing account is created:")
            print("Account# is CHE\(accountNumber)");
            print("Initial Balance:\(initialBalance)")
            overdraftStatus = false;
        case .Saving:
            initialBalance = 200;
            print("Hey! Your saving account is created:")
            print("Account# is SAV\(accountNumber)");
            print("Initial Balance:\(initialBalance)")
            overdraftStatus = true;
        default:
            initialBalance = 50;
            print("Hey! Your personal account is created:")
            print("Account# is SAV\(accountNumber)");
            print("Initial Balance:\(initialBalance)")
            overdraftStatus = false;
        }
        
        return overdraftStatus
        
    }
    
    func checkOverDraft()
    {
        if(overdraftProtector == true)
        {
            if(balance < -500 )
            {
                print("Deposit more money. You aren't allowed to overdraft more than 500")
            }
                
            else
            {
                balance = balance - 0.50
                print("Balance after overdraft")
                totalBalance();
            }
        }
            
        else {
            print("You do not have overdraft protection!")
        }
    }
    //    func overdraftCheck()
    //    {
    //
    //        var overDraft = createAccount(accountType: caseAccount)
    //
    //        if(overDraft == true)
    //        {
    //            if(balance < -500 )
    //            {
    //                print("Deposit more money. You aren't allowed to overdraft more than 500")
    //            }
    //
    //            else
    //            {
    //                balance = balance - 0.50
    //                print("Balance after overdraft")
    //                totalBalance();
    //            }
    //        }
    //
    //        else {
    //            print("You do not have overdraft protection!")
    //        }
    //    }
    
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
    
    
    //    func changePin()
    
    
}



var bank = Bank();
bank.welcome(nameOfBank: "RBC");

var accountInstance = Account();
var caseAccount = Account.accountTypes.Chequing
//accountInstance.createAccount(accountType: caseAccount)
//accountInstance.deposit(amountToDeposit: 2500)
//accountInstance.withdrawal(amountToWithdraw: 1000)

var client = Client(name: "Ekta", address: "Woodbridge", age: 23, dob: "09-10-1995", gender: "Female",nameOfBank: "RBC", account: accountInstance);
print("Name: \(client.name), Address: \(client.address), Age:  \(client.age), Date of birth: \(client.dob), Gender: \(client.gender), Bank name: \(client.nameOfBank)");

client.welcome(nameOfBank: "Scotiabank");
print("Want to change your name?")
client.changeName(newName: "Kavita");
print("Want to change your address?")
client.changeAddress(newAddress: "Vaughan");
print("Want to change your pin?")
client.changePin(newPin: 1945)

print("What type of account you want to create?")
var clientAccount = accountInstance;
clientAccount.createAccount(accountType: caseAccount)
clientAccount.deposit(amountToDeposit: 2500)
bank.giveTransactionHistory()
clientAccount.withdrawal(amountToWithdraw: 1000)
bank.giveTransactionHistory()
clientAccount.checkOverDraft()








