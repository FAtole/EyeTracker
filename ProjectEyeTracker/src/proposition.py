
class Proposition:
    def __init__(self,row):#cree depuis un fichier csv
        # cree un assert pour au moins 3 elements dans row
        self.question=row[1]
        self.reponses =row[2:]
        self.format =row[0]
    
    def Nbr_Reponses(self) -> int:
        return len(self.reponses)

    def Get_row(self):
        row=[self.format, self.question]
        for i in self.reponses:
            row.append(i)
        return row

    def __str__(self):
        return "Format : "+ self.format + "Question : "+self.question+";Reponses : "+str(self.reponses)