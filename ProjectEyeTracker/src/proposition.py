
class Proposition:
    def __init__(self,row):#cree depuis un fichier csv
        # cree un assert pour au moins 3 elements dans row
        self.question=row[0]
        self.reponses =row[1:]
        self.format ="Carre"
    
    def Nbr_Reponses(self) -> int:
        return len(self.reponses)

    def Get_row(self):
        row=[self.question]
        for i in self.reponses:
            row.append(i)
        return row

    def __str__(self):
        return "Question : "+self.question+";Reponses : "+str(self.reponses)