import UIKit
import CoreData

class ToDoListViewController: UIViewController {
    
    private let ToDoListView = ToDoView()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        configureNavigationBar()
        configureSearchBar()
        configureTableView()
        
        // Load initial items
        loadItems()
    }
    
    func configureTableView() {
        ToDoListView.frame = view.bounds
        view.addSubview(ToDoListView)
        ToDoListView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom) // searchBar'ning pastki chetiga moslashish
            make.leading.trailing.bottom.equalToSuperview() // Barcha qirralarga moslashish
        }
    }
    
    func configureNavigationBar() {
        let addButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app.fill"),
            style: .plain,
            target: self,
            action: #selector(addTapped)
        )
        
        addButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = addButton
        title = "Profile"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func configureSearchBar() {
        searchBar.placeholder = "Search Items"
        searchBar.delegate = self
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top) // Safe area boshlanishi
            make.leading.trailing.equalToSuperview() // Chap va o'ngga moslashish
        }
    }
    
    @objc func addTapped() {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ToDo", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add Item", style: .default) { _ in
            guard let text = textField.text, !text.isEmpty else { return }
            let newItem = Item(context: self.context)
            newItem.title = text
            newItem.done = false
            self.ToDoListView.itemArray.append(newItem)
            self.saveItem()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItem() {
        do {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
        }
        loadItems()
    }
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
        let compoundPredicate: NSPredicate
        if let predicate = predicate {
            compoundPredicate = predicate
        } else {
            compoundPredicate = NSPredicate(value: true)
        }
        request.predicate = compoundPredicate
        
        do {
            ToDoListView.itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data, \(error)")
        }
        ToDoListView.reloadData()
    }
}

extension ToDoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            loadItems()
            return
        }
        
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        loadItems(predicate: predicate)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            loadItems()
        }
    }
}
