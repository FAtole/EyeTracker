from tkinter import Tk, Label


# On définit une classe fenêtre 
class MyWindow(Tk):

    def __init__(self):
        # On appelle le constructeur parent
        super().__init__()


        # On dimensionne la fenêtre en plein ecran         
        #self.state('zoomed') 
        w, h = self.winfo_screenwidth()/2, self.winfo_screenheight()/2
        self.geometry("%dx%d+0+0" % (w, h))

        # On configure les poids
        self.columnconfigure(0, weight=1)
        self.columnconfigure(1, weight=1)
        self.rowconfigure(0, weight=1)
        self.rowconfigure(1, weight=5)
        self.rowconfigure(2, weight=5)

        # Le Rectangle Question
        Question = Label(self, text="Question",bg="yellow", fg="black", font=('Times 28'))
        Question.grid(column=0, row=0,columnspan=2, ipadx=10, ipady=10, sticky="NSEW")

        # Les Rectangles Reponses
        Reponse_1 = Label(self, text="Reponse 1",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_1.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_2 = Label(self, text="Reponse 2",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_2.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_3 = Label(self, text="Reponse 3",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_3.grid(column=1, row=2, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_4 = Label(self, text="Reponse 4",bg="red", fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_4.grid(column=0, row=2, ipadx=10, ipady=10, sticky="NSEW")


        # On ajoute un titre à la fenêtre
        self.title("Eye Tracker")
       



# On crée notre fenêtre et on l'affiche
window = MyWindow()
window.mainloop()