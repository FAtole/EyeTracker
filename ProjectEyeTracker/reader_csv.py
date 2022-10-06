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

