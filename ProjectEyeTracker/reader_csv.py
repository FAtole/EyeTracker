import csv
from proposition import Proposition

# Class pour lire les csv


class Load_CSV:
    def __init__(self):
        self.emplacement_fichier_csv = "question_reponses.csv"
        self.Propositions = []
        self.nbr_questions = 0
        with open(self.emplacement_fichier_csv, 'r', encoding='utf-8') as f:
            reader = csv.reader(f)
            for row in reader:
                if self.nbr_questions != 0:  # je ne prends pas la premiere ligne du csv
                    self.Propositions.append(Proposition(row))
                self.nbr_questions += 1

    def Get_Proposition(self, i) -> Proposition:
        # 0<= i <= len(self.Proposition)
        return self.Propositions[i]

    def Get_Question(self) -> list:
        questions = []
        for prop in self.Propositions:
            questions.append(prop.question)
        return questions

    def Add_Proposition(self,proposition):
        self.Propositions.insert(0,proposition)

    def Remove_proposition(self,index):
        self.Propositions.pop(index)

    def Save(self):
        with open(self.emplacement_fichier_csv, 'w', newline='',encoding='utf-8') as csvfile:
            fieldnames = ['Question','Reponse1','Reponse2','Reponse3','Reponse4']
            writer = csv.writer(csvfile)
            writer.writerow(fieldnames)
            for prop  in self.Propositions:
                writer.writerow(prop.Get_row())
