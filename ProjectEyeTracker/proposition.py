
class Proposition:
    def __init__(self,row):#cree depuis un fichier csv
        # cree un assert pour au moins 3 elements dans row
        self.question=row[0]
        self.reponses =row[1:]
    
    def Nbr_Reponses(self) -> int:
        return len(self.reponses)

    def __str__(self):
        return "Question : "+self.question+";Reponses : "+str(self.reponses)