
from markdown_it import main


class Proposition:
    def __init__(self,row):#cree depuis un fichier csv
        # cree un assert pour au moins 3 elements dans row
        self.question=row[3]
        self.reponses =row[4:]
        self.format =row[2]
        self.date =row[1]
        self.favoris = eval(row[0])
    
    def Nbr_Reponses(self) -> int:
        return len(self.reponses)

    def Get_row(self):
        row=[str(self.favoris), self.date, self.format, self.question]
        for i in self.reponses:
            row.append(i)
        return row

    def __str__(self):
        return "Favoris: "+self.favoris+" Date: "+self.date+ " Format : "+ self.format + " Question : "+self.question+" Reponses : "+str(self.reponses)


