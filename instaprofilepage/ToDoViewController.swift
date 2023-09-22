import UIKit
import CoreData

class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var tableView: UITableView!
    var tasks: [Task] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
        setupNavigationBar()
        loadTasks()
    }
    
    func setupTableView() {
            // TableView 생성 및 설정
            tableView = UITableView()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "taskCell")
            view.addSubview(tableView)
            
            // SnapKit을 사용하여 제약조건 설정
            tableView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            // 오른쪽 상단에 + 버튼 추가 (새로운 할일을 추가하는 버튼)
            //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask(_:)))
        }
    
    // MARK: TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = tasks[indexPath.row]
        
        cell.textLabel?.text = task.title
        
        return cell
    }
    
    // MARK: TableView Delegate
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            tasks.remove(at: indexPath.row)
            context.delete(task)
            saveTasks()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        
        let alert = UIAlertController(title: "Edit Task", message: "Edit your task", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            let textField = alert.textFields![0]
            
            task.title = textField.text
            self.saveTasks()
            self.tableView.reloadData()
        }
        
        alert.addTextField { textField in
            textField.text = task.title
        }
        
        alert.addAction(saveAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: CRUD Operations
    
    func setupNavigationBar() {
            // 오른쪽 상단에 + 버튼 추가 (새로운 할일을 추가하는 버튼)
            let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
            navigationItem.rightBarButtonItem = addButton
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addTask() {
            let alert = UIAlertController(title: "할 일 추가", message: "할 일을 추가해주세요.", preferredStyle: .alert)
            
            let addAction = UIAlertAction(title: "추가하기", style: .default) { _ in
                let textField = alert.textFields![0]
                
                let newTask = Task(context: self.context)
                newTask.title = textField.text
                newTask.createDate = Date()
                newTask.id = UUID()
                newTask.isCompleted = false
                newTask.modifyDate = Date()
                
                self.tasks.append(newTask)
                self.saveTasks()
                self.tableView.reloadData()
            }
            
            alert.addTextField { textField in
                textField.placeholder = "Task title"
            }
            
            alert.addAction(addAction)
            
            present(alert, animated: true, completion: nil)
        }

    
    
    
    func saveTasks() {
        do {
            try context.save()
        } catch {
            print("Error saving task: \(error)")
        }
    }
    
    func loadTasks() {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            tasks = try context.fetch(request)
        } catch {
            print("Error loading tasks: \(error)")
        }
        
        tableView.reloadData()
    }
}
