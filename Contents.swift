
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
    
    // Function for printing the name of the bank.
    func welcome(nameOfBank: String)
    {
        print("Welcome to the \(nameOfBank) bank");
        
    }
    
    //Printing the transaction status whether it's done or not
    func giveTransactionHistory()
    {
        print("Successful Transaction");
    }
    
}

//Client class inheriting from bank and also using instance of account class for using most of it's properties and functions.

class Client: Bank
{
    
    var name: String
    var address: String
    var age: Int
    var dob: String
    var gender: String
    var account: Account;
    var pin: Int = 0;
    
    //Default constructor which is overriding super class's constructor.
    override init()
    {
        name = "";
        address = "";
        age = 0;
        dob = "";
        gender = "";
        account = Account();
        pin = 0;
        super.init();
    }
    
    //Parameterized constructor
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
    
    //Client class is inheriting from bank class so it's neccessary to write this method.
    override func welcome(nameOfBank: String)
    {
        print("Welcome to the \(nameOfBank) bank");
    }
    
    //function Change name to change the name of the client.This method is here because nowadays client can change profile info online as well.
    //There is no need to go to the bank for changing profile info.
    
    func changeName(newName: String)
    {
        self.name = newName;
        print("Updated name: \(name)");
    }
    
    //function Change address to change the address of the client.
    func changeAddress(newAddress: String)
    {
        self.address = newAddress;
        print("Updated address: \(address)");
    }
    
    //Change pin
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
    
    //Function create account using enum to create an account.
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
    
    //First check an account has overdraft protection or not.
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

var accountInstance = Account();
var caseAccount = Account.accountTypes.Chequing

var client = Client(name: "Ekta", address: "Woodbridge", age: 23, dob: "09-10-1995", gender: "Female",nameOfBank: "Scotiabank", account: accountInstance);

client.welcome(nameOfBank: "Scotiabank");
print("")
print("Name: \(client.name), Address: \(client.address), Age:  \(client.age), Date of birth: \(client.dob), Gender: \(client.gender), Bank name: \(client.nameOfBank)");
print("")

print("Want to change your name?")
client.changeName(newName: "Kavita");
print("")

print("Want to change your address?")
client.changeAddress(newAddress: "Vaughan");
print("")

print("Want to change your pin?")
client.changePin(newPin: 1945)

print("")
print("What type of account you want to create?")
var clientAccount = accountInstance;
print("Create Chequing Account")
clientAccount.createAccount(accountType: caseAccount)
print("")

print("How much amount you want to deposit?")
clientAccount.deposit(amountToDeposit: 2500)
print("")

print("Do you want to check transaction status?")
bank.giveTransactionHistory()
print("")

print("Want to withdraw?")
clientAccount.withdrawal(amountToWithdraw: 1000)
print("")

print("Do you want to check transaction status?")
bank.giveTransactionHistory()
print("")
print("Overdraft")
clientAccount.checkOverDraft()
print("")







