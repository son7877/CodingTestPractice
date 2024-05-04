import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


class Person {
    int age;
    String name;

    public Person(int age, String name) {
        this.age = age;
        this.name = name;
    }
}

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int num = Integer.parseInt(br.readLine());
        List<Person> persons = new ArrayList<>();

        for(int i=0;i<num;i++){
            String [] str = br.readLine().split(" ");
            int age = Integer.parseInt(str[0]);
            String name= str[1];
            persons.add(new Person(age,name));
        }

        persons.sort((person1, person2) -> Integer.compare(person1.age, person2.age));

        for(Person person : persons){
            System.out.println(person.age+" "+person.name);
        }

    }
}
