package java8;//Employee Management System (real time queries)

import java.util.*;
import java.util.stream.Collectors;

public class Employee {
    int id;
    String name;
    int age;
    String gender;
    String department;
    int yearOfJoining;
    double salary;

    public Employee(int id, String name, int age, String gender, String department, int yearOfJoining, double salary) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.department = department;
        this.yearOfJoining = yearOfJoining;
        this.salary = salary;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getGender() {
        return gender;
    }

    public String getDepartment() {
        return department;
    }

    public int getYearOfJoining() {
        return yearOfJoining;
    }

    public double getSalary() {
        return salary;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                ", department='" + department + '\'' +
                ", yearOfJoining=" + yearOfJoining +
                ", salary=" + salary +
                '}';
    }

    public static void main(String[] args) {
        List<Employee> employeeList = new ArrayList<Employee>();

        employeeList.add(new Employee(1, "Disha", 32, "Female", "HR", 2011, 25000.0));
        employeeList.add(new Employee(2, "Sagar", 25, "Male", "Sales And Marketing", 2015, 13500.0));
        employeeList.add(new Employee(3, "Vishal", 29, "Male", "Infrastructure", 2012, 18000.0));
        employeeList.add(new Employee(4, "Akshay", 28, "Male", "Product Development", 2014, 32500.0));
        employeeList.add(new Employee(5, "Surbhi", 27, "Female", "HR", 2013, 22700.0));
        employeeList.add(new Employee(6, "Shreyas", 43, "Male", "Security And Transport", 2016, 10500.0));
        employeeList.add(new Employee(7, "Aman", 35, "Male", "Account And Finance", 2010, 27000.0));
        employeeList.add(new Employee(8, "Anuj", 31, "Male", "Product Development", 2015, 34500.0));
        employeeList.add(new Employee(9, "Aakansha", 24, "Female", "Sales And Marketing", 2016, 11500.0));
        employeeList.add(new Employee(10, "Manish", 38, "Male", "Security And Transport", 2015, 11000.5));


        //How many male and female employees are there in the organization?

        Map<String, Long> noOfMaleAndFemaleEmployees =
                employeeList.stream().collect(Collectors.groupingBy(Employee::getGender, Collectors.counting()));

        System.out.println(noOfMaleAndFemaleEmployees);

        System.out.println("------------------------------------------------------------------");

        //Print the name of all departments in the organization?

        employeeList.stream()
                .map(Employee::getDepartment)
                .distinct()
                .forEach(System.out::println);

        System.out.println("------------------------------------------------------------------");

        // What is the average age of male and female employees?
        //Avg  to and float to number of on this type: By map

        Map<String, Double> avgAgeOfMaleAndFemaleEmployees =
                employeeList.stream().collect(Collectors.groupingBy(Employee::getGender, Collectors.averagingInt(Employee::getAge)));

        System.out.println(avgAgeOfMaleAndFemaleEmployees);

        System.out.println("------------------------------------------------------------------");

        //Get the details of highest paid employee in the organization?
        //by using comparator and using Collectors.maxBy method

        Optional<Employee> highestPaidEmployeeWrapper =
                employeeList.stream().collect(Collectors.maxBy(Comparator.comparingDouble(Employee::getSalary)));

        Employee highestPaidEmployee = highestPaidEmployeeWrapper.get();

        System.out.println("Highest Paid Employee :- ");

        System.out.println("ID : " + highestPaidEmployee.getId());

        System.out.println("Name : " + highestPaidEmployee.getName());

        System.out.println("Age : " + highestPaidEmployee.getAge());

        System.out.println("Gender : " + highestPaidEmployee.getGender());

        System.out.println("Department : " + highestPaidEmployee.getDepartment());

        System.out.println("Year Of Joining : " + highestPaidEmployee.getYearOfJoining());

        System.out.println("Salary : " + highestPaidEmployee.getSalary());

        System.out.println("------------------------------------------------------------------");

        // Get the names of all employees who have joined after 2015?

        employeeList.stream()
                .filter(e -> e.getYearOfJoining() > 2015)
                .map(Employee::getName)
                .forEach(System.out::println);

        System.out.println("------------------------------------------------------------------");

        // Count the number of employees in each department?

        Map<String, Long> employeeCountByDepartment =
                employeeList.stream().collect(Collectors.groupingBy(Employee::getDepartment, Collectors.counting()));

        Set<Map.Entry<String, Long>> entrySet = employeeCountByDepartment.entrySet();

        for (Map.Entry<String, Long> entry : entrySet) {
            System.out.println(entry.getKey() + " : " + entry.getValue());
        }

        System.out.println("------------------------------------------------------------------");



    }


}

