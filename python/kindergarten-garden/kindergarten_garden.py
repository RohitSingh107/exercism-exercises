
student_list = ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Fred', 'Ginny', 'Harriet', 'Ileana', 'Joseph', 'Kincaid', 'Larry']

class Garden:
    def __init__(self, diagram, students = student_list):
        students = sorted(students)
        self.garden_layout = diagram.split()
        self.student_dict = {x:y for (x,y) in zip(students, range(0,23,2))}
    
    def plants(self, student):
        plant_list = self.garden_layout[0][self.student_dict[student]:self.student_dict[student] + 2] + self.garden_layout[1][self.student_dict[student]: self.student_dict[student] + 2]
        final_list = []
        for i in plant_list:
            if i == "G":
                final_list.append("Grass")
            elif i == "C":
                final_list.append("Clover")
            elif i == "R":
                final_list.append("Radishes")
            elif i == "V":
                final_list.append("Violets")
        return final_list
            